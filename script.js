const screens = [
  {
    image: 'images/screen-1.svg',
    title: 'Tela inicial',
    description:
      'Seleção rápida de áreas com cards temáticos e CTA para iniciar a experiência em RA.'
  },
  {
    image: 'images/screen-2.svg',
    title: 'Ambiente AR sendo carregado',
    description:
      'O usuário recebe instruções para apontar a câmera para uma superfície plana e iluminar bem o ambiente.'
  },
  {
    image: 'images/screen-3.svg',
    title: 'Simulação biomédica',
    description:
      'Ambiente 3D com bancada virtual, ferramentas interativas e passos gamificados de análise de amostras.'
  },
  {
    image: 'images/screen-4.svg',
    title: 'Feedback da IA',
    description:
      'Resumo de desempenho, análise do estilo de raciocínio e carreiras sugeridas com base na afinidade.'
  },
  {
    image: 'images/screen-5.svg',
    title: 'Trilha personalizada',
    description:
      'Lista de microcursos, mentorias e materiais gratuitos alinhados à recomendação gerada pela IA.'
  }
];

const screenImage = document.getElementById('screen-image');
const screenDescription = document.getElementById('screen-description');
const chips = Array.from(document.querySelectorAll('.chip'));

function setScreen(index) {
  const screen = screens[index];
  if (!screen) return;

  screenImage.src = screen.image;
  screenImage.alt = `Protótipo - ${screen.title}`;

  screenDescription.innerHTML = `
    <h3>${screen.title}</h3>
    <p>${screen.description}</p>
  `;

  chips.forEach((chip, chipIndex) => {
    chip.classList.toggle('chip--active', chipIndex === index);
  });
}

chips.forEach((chip, index) => {
  chip.addEventListener('click', () => setScreen(index));
});