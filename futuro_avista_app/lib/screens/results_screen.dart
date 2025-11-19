import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/experience.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.experience, required this.completedSteps});

  final Experience experience;
  final int completedSteps;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback da IA'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: experience.highlightColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Você concluiu $completedSteps etapas em ${experience.title}.',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Perfil identificado: raciocínio ${completedSteps >= 2 ? 'analítico e atenção aos detalhes' : 'exploratório, buscando novas abordagens criativas'}.'
                  ' Continue testando novas áreas para comparar seus interesses.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text('Carreiras recomendadas', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          ...experience.recommendedCareers.map(
            (career) => Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: ListTile(
                title: Text(career, style: GoogleFonts.montserrat(fontWeight: FontWeight.w600)),
                subtitle: const Text('Com base em sua performance nesta simulação.'),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Trilha sugerida', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          ...experience.learningPath.map(
            (step) => Card(
              child: ListTile(
                title: Text(step['title'] ?? ''),
                subtitle: Text(step['provider'] ?? ''),
                trailing: const Icon(Icons.open_in_new),
                onTap: () {},
              ),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            child: const Text('Explorar outra área'),
          ),
        ],
      ),
    );
  }
}
