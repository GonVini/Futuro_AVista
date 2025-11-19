import 'package:flutter/material.dart';

import '../models/experience.dart';

final List<Experience> experiences = [
  Experience(
    id: 'bio-lab',
    area: 'Saúde',
    title: 'Laboratório Biomédico',
    subtitle: 'Analise amostras e faça diagnósticos em tempo real',
    description:
        'Simulação curta para quem gosta de investigação científica e quer testar habilidades analíticas em biomedicina.',
    objectives: [
      'Identificar contaminantes usando indicadores luminosos',
      'Organizar tubos de ensaio pela gravidade do caso',
      'Registrar hipóteses rápidas em um painel digital',
    ],
    modelUrl: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
    instructions: [
      'Aponte a câmera para uma superfície plana e toque para ancorar a bancada virtual.',
      'Toque nos reagentes destacados para adicionar gotas e observar a reação.',
      'Capture o resultado aproximando o painel holográfico.',
    ],
    highlightColor: const Color(0xFF35B3A8),
    recommendedCareers: [
      'Analista de Dados em Saúde',
      'Engenheiro Biomédico',
      'Técnico em Pesquisa Laboratorial',
    ],
    learningPath: [
      {
        'title': 'Bioquímica aplicada',
        'provider': 'SENAI',
        'url': 'https://www.portaldaindustria.com.br/senai/',
      },
      {
        'title': 'Introdução a dados clínicos',
        'provider': 'Coursera',
        'url': 'https://www.coursera.org/',
      },
      {
        'title': 'Laboratórios virtuais XR',
        'provider': 'Meta Spark',
        'url': 'https://metaspark.com/',
      },
    ],
  ),
  Experience(
    id: 'ux-lab',
    area: 'Design',
    title: 'Sprint de UX Imersivo',
    subtitle: 'Projete interfaces em um canvas flutuante',
    description:
        'Oficina rápida para testar raciocínio visual e colaboração, ideal para quem pensa em seguir product design.',
    objectives: [
      'Organizar componentes seguindo heurísticas de usabilidade',
      'Testar uma microinteração com o painel flutuante',
      'Exportar um protótipo em realidade aumentada',
    ],
    modelUrl: 'https://modelviewer.dev/shared-assets/models/ShopifyModels/Chair.glb',
    instructions: [
      'Ajuste o canvas tocando e arrastando com dois dedos.',
      'Selecione um widget e posicione-o na interface.',
      'Finalize enviando o mockup para revisão.',
    ],
    highlightColor: const Color(0xFFF2A900),
    recommendedCareers: [
      'Product Designer XR',
      'Especialista em Experiências Multimodais',
      'Facilitador de Design Sprint',
    ],
    learningPath: [
      {
        'title': 'Fundamentos de UI/UX',
        'provider': 'FIGMA',
        'url': 'https://www.figma.com/',
      },
      {
        'title': 'Prototipagem para XR',
        'provider': 'Unity Learn',
        'url': 'https://learn.unity.com/',
      },
      {
        'title': 'Design centrado em dados',
        'provider': 'Alura',
        'url': 'https://www.alura.com.br/',
      },
    ],
  ),
  Experience(
    id: 'green-ops',
    area: 'Sustentabilidade',
    title: 'Central de Energia Verde',
    subtitle: 'Balanceie recursos e otimize a matriz energética',
    description:
        'Simulação para perfis estratégicos interessados em energia limpa, cidades inteligentes e economia circular.',
    objectives: [
      'Comparar indicadores de geração solar e eólica',
      'Configurar baterias virtuais e prever demanda',
      'Publicar um relatório rápido com o plano ideal',
    ],
    modelUrl: 'https://modelviewer.dev/shared-assets/models/RobotExpressive.glb',
    instructions: [
      'Encontre uma superfície ampla para posicionar a central.',
      'Use gestos para redimensionar as turbinas virtuais.',
      'Acesse o painel lateral para publicar seu plano.',
    ],
    highlightColor: const Color(0xFF6FCF97),
    recommendedCareers: [
      'Gestor de Energia Renovável',
      'Analista ESG',
      'Consultor de Cidades Inteligentes',
    ],
    learningPath: [
      {
        'title': 'Energia solar distribuída',
        'provider': 'Sebrae',
        'url': 'https://www.sebrae.com.br/',
      },
      {
        'title': 'Monitoramento ambiental com dados',
        'provider': 'NASA Open Learning',
        'url': 'https://appliedsciences.nasa.gov/',
      },
      {
        'title': 'Economia circular aplicada',
        'provider': 'PUC-Rio',
        'url': 'https://www.puc-rio.br/',
      },
    ],
  ),
];
