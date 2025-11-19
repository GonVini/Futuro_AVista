import 'package:flutter/material.dart';

class Experience {
  const Experience({
    required this.id,
    required this.area,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.objectives,
    required this.modelUrl,
    required this.instructions,
    required this.highlightColor,
    required this.recommendedCareers,
    required this.learningPath,
  });

  final String id;
  final String area;
  final String title;
  final String subtitle;
  final String description;
  final List<String> objectives;
  final String modelUrl;
  final List<String> instructions;
  final Color highlightColor;
  final List<String> recommendedCareers;
  final List<Map<String, String>> learningPath;
}
