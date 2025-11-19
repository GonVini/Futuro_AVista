import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../models/experience.dart';
import '../widgets/ar_instruction_overlay.dart';
import 'results_screen.dart';

class SimulationScreen extends StatefulWidget {
  const SimulationScreen({super.key, required this.experience});

  final Experience experience;

  @override
  State<SimulationScreen> createState() => _SimulationScreenState();
}

class _SimulationScreenState extends State<SimulationScreen> {
  ARSessionManager? sessionManager;
  ARAnchorManager? anchorManager;
  ARObjectManager? objectManager;
  ARNode? node;
  ARPlaneAnchor? anchor;
  int completedSteps = 0;
  bool hasPlacedObject = false;

  @override
  void dispose() {
    sessionManager?.dispose();
    super.dispose();
  }

  Future<void> onARViewCreated(
    ARSessionManager arSessionManager,
    ARAnchorManager arAnchorManager,
    ARObjectManager arObjectManager,
  ) async {
    sessionManager = arSessionManager;
    anchorManager = arAnchorManager;
    objectManager = arObjectManager;

    await sessionManager?.setupPlaneDetection(PlaneDetectionConfig.horizontal);
    await sessionManager?.onPlaneOrPointTap = onPlaneTap;
  }

  Future<void> onPlaneTap(List<ARHitTestResult> hits) async {
    if (hits.isEmpty || objectManager == null || hasPlacedObject) return;
    final hit = hits.firstWhere(
      (element) => element.type == ARHitTestResultType.plane,
      orElse: () => hits.first,
    );
    anchor = await anchorManager?.addARPlaneAnchor(hit.worldTransform, PlaneAnchorAlignment.horizontal);
    if (anchor == null) return;

    node = ARNode(
      type: NodeType.webGLB,
      uri: widget.experience.modelUrl,
      scale: vector.Vector3.all(0.5),
      position: vector.Vector3.zero(),
    );
    final didAddNode = await objectManager?.addNode(node!, planeAnchor: anchor!);
    if (didAddNode == true) {
      setState(() => hasPlacedObject = true);
    }
  }

  void completeStep() {
    if (completedSteps >= widget.experience.instructions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultsScreen(experience: widget.experience, completedSteps: completedSteps),
        ),
      );
      return;
    }
    setState(() => completedSteps++);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            ARView(
              onARViewCreated: onARViewCreated,
              planeDetectionConfig: PlaneDetectionConfig.horizontal,
            ),
            ARInstructionOverlay(
              steps: widget.experience.instructions,
              completed: completedSteps,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.experience.title,
                      style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.experience.description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      onPressed: completeStep,
                      icon: Icon(completedSteps >= widget.experience.instructions.length
                          ? Icons.insights
                          : Icons.play_arrow),
                      label: Text(completedSteps >= widget.experience.instructions.length
                          ? 'Ver feedback'
                          : 'Concluir etapa'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                        backgroundColor: widget.experience.highlightColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 12,
              left: 12,
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
