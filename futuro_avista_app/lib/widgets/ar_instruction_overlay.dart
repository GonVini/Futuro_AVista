import 'package:flutter/material.dart';

class ARInstructionOverlay extends StatelessWidget {
  const ARInstructionOverlay({super.key, required this.steps, required this.completed});

  final List<String> steps;
  final int completed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.55),
          borderRadius: BorderRadius.circular(24),
        ),
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 420),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Etapas concluídas: $completed/${steps.length}',
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ...steps.asMap().entries.map(
                  (entry) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        entry.key < completed ? Icons.check_circle : Icons.radio_button_unchecked,
                        size: 16,
                        color: entry.key < completed ? Colors.greenAccent : Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          entry.value,
                          style: theme.textTheme.bodySmall?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
