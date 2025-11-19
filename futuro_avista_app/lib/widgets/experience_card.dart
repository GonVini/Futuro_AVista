import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/experience.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience, this.onTap});

  final Experience experience;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Ink(
        decoration: BoxDecoration(
          color: experience.highlightColor.withOpacity(0.09),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: experience.highlightColor.withOpacity(0.4)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              experience.area.toUpperCase(),
              style: theme.textTheme.labelSmall?.copyWith(
                letterSpacing: 1.2,
                color: experience.highlightColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              experience.title,
              style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              experience.subtitle,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: experience.objectives
                  .map(
                    (item) => Chip(
                      label: Text(item),
                      labelStyle: const TextStyle(fontSize: 12),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                        side: BorderSide(color: experience.highlightColor.withOpacity(0.4)),
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  'Explorar agora',
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: experience.highlightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                Icon(Icons.chevron_right, color: experience.highlightColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
