// Definição do objeto do jogador
const jogador = {
  nome: "seu madruga",
  vida: 150,
  ataque: 30,
  defesa: 40,
  ataqueInimigo: function() {
    return Math.floor(Math.random() * (this.ataque - this.defesa));
  },
  defender: function() {
    return Math.floor(Math.random() * this.defesa);
  }
};

// Função para criar um gladiador inimigo
function criarGladiador() {
  const nomes = ["chaves 1", "pica-pau", "dora aventureira"];
  const nomeAleatorio = nomes[Math.floor(Math.random() * nomes.length)];
  return {
    nome: nomeAleatorio,
    vida: 50 + Math.floor(Math.random() * 50),
    ataque: 10 + Math.floor(Math.random() * 20),
    defesa: 5 + Math.floor(Math.random() * 10),
    ataqueInimigo: function() {
      return Math.floor(Math.random() * (this.ataque - this.defesa));
    },
    defender: function() {
      return Math.floor(Math.random() * this.defesa);
    }
  };
}

// Função para simular um turno de combate
function turnoDeCombate(jogador, inimigo) {
  const danoDoJogador = jogador.ataqueInimigo();
  const danoDoInimigo = inimigo.ataqueInimigo();

  const defesaDoJogador = jogador.defender();
  const defesaDoInimigo = inimigo.defender();

  const danoAoJogador = Math.max(0, danoDoInimigo - defesaDoJogador);
  const danoAoInimigo = Math.max(0, danoDoJogador - defesaDoInimigo);

  jogador.vida -= danoAoJogador;
  inimigo.vida -= danoAoInimigo;

  console.log(`${jogador.nome} atacou ${inimigo.nome} e causou ${danoAoInimigo} de dano.`);
  console.log(`${inimigo.nome} atacou ${jogador.nome} e causou ${danoAoJogador} de dano.`);

  if (jogador.vida <= 0) {
    console.log(`${jogador.nome} foi derrotado. ${inimigo.nome} venceu!`);
  } else if (inimigo.vida <= 0) {
    console.log(`${inimigo.nome} foi derrotado. ${jogador.nome} venceu!`);
  }
}

// Loop do jogo
while (jogador.vida > 0) {
  const inimigo = criarGladiador();
  console.log(`Um novo inimigo, ${inimigo.nome}, apareceu na arena com ${inimigo.vida} de vida!`);
  console.log("É hora de lutar!");

  while (jogador.vida > 0 && inimigo.vida > 0) {
    turnoDeCombate(jogador, inimigo);
  }
}
