# Futuro à Vista - Aplicativo AR

Aplicativo Flutter que demonstra a experiência mobile descrita no pitch do Futuro à Vista. A primeira versão foca na simulação em realidade aumentada com modelos 3D remotos e fluxos de interface para escolha de áreas, visualização da simulação e feedback.

## Principais recursos
- Catálogo de áreas (Saúde, Tecnologia, Design, Sustentabilidade e Indústrias Criativas).
- Simulação em AR usando [`ar_flutter_plugin`](https://pub.dev/packages/ar_flutter_plugin) com carregamento de modelos `.glb` hospedados na web.
- Tarefas guiadas, contador de objetivos concluídos e feedback imediato.
- Resultado com análise de perfil e recomendações de carreiras.
- Trilha sugerida com microcursos e links externos.

## Pré-requisitos
1. [Flutter](https://docs.flutter.dev/get-started/install) 3.22 ou superior.
2. Dispositivo ou emulador com suporte a ARCore (Android) ou ARKit (iOS).
3. Para Android, ative o modo desenvolvedor e instale o `ARCore` caso necessário.

## Como executar
```bash
cd futuro_avista_app
flutter pub get
flutter run
```
> Caso o diretório ainda não tenha as pastas de plataforma (`android`, `ios`, etc.), execute `flutter create .` antes de rodar o app.

## Estrutura principal
```
lib/
  data/
    sample_experiences.dart
  models/
    experience.dart
  screens/
    home_screen.dart
    simulation_screen.dart
    results_screen.dart
  widgets/
    ar_instruction_overlay.dart
    experience_card.dart
  main.dart
assets/
  images/
    home_mock.svg
    lab_mock.svg
```

## Próximos passos sugeridos
- Integrar o motor de IA para recomendar trilhas dinâmicas baseadas no desempenho real dos estudantes.
- Persistir progresso e histórico do usuário na nuvem.
- Criar editor de atividades para docentes configurarem simulações personalizadas.

