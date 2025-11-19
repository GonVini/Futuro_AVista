import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/sample_experiences.dart';
import '../models/experience.dart';
import '../widgets/experience_card.dart';
import 'simulation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedArea;

  List<Experience> get filteredExperiences {
    if (selectedArea == null) return experiences;
    return experiences.where((exp) => exp.area == selectedArea).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Futuro à Vista',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: theme.colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Text(
              'Vivencie profissões em minutos',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Escolha uma área e use a câmera para trazer o ambiente profissional para a sua mesa.',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                'Saúde',
                'Tecnologia',
                'Design',
                'Sustentabilidade',
                'Indústrias Criativas',
              ].map((area) {
                final isSelected = area == selectedArea;
                return FilterChip(
                  label: Text(area),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedArea = isSelected ? null : area),
                  selectedColor: theme.colorScheme.primary,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : theme.colorScheme.onSurface,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            ...filteredExperiences.map(
              (experience) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ExperienceCard(
                  experience: experience,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SimulationScreen(experience: experience),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
