# Intelecto Quiz 

Aplicação mobile de quizzes desenvolvida com Flutter, onde o usuário pode escolher uma área do conhecimento e responder perguntas de múltipla escolha.

As perguntas e suas respectivas alternativas e respostas são obtidas por meio de uma API externa. A aplicação também utiliza uma segunda API para exibir uma frase de um pensador na tela inicial.

## ✨ Funcionalidades

- Seleção da área do conhecimento
- Perguntas de múltipla escolha
- Diferentes categorias de perguntas
- Indicação das alternativas disponíveis
- Validação das respostas
- Sistema de pontuação
- Exibição da pontuação final
- Frase de um pensador exibida na tela inicial

## 🎯 Áreas do conhecimento

O usuário pode escolher entre diferentes categorias antes de iniciar o quiz, após escolher uma categoria, as perguntas correspondentes são carregadas pela API.

## 🎮 Como funciona

Ao abrir o aplicativo, o usuário encontra a tela inicial com a opção de escolher uma área do conhecimento e iniciar um novo quiz.

Uma frase de um pensador também é apresentada nessa tela, obtida por meio de uma API externa.

Após iniciar a partida:

1. Uma pergunta é apresentada.
2. O usuário escolhe uma das alternativas.
3. A resposta é verificada.
4. A pontuação é atualizada de acordo com o resultado.
5. O usuário continua respondendo às perguntas.
6. Ao final, a pontuação total é apresentada.

## 🌐 Integração com APIs

O aplicativo utiliza duas APIs externas.

### API de perguntas

Responsável por fornecer:

- perguntas
- alternativas
- resposta correta
- categoria das perguntas

### API de frases

Responsável por fornecer uma frase de um pensador para ser exibida na tela inicial do aplicativo.

Essa integração adiciona um elemento diferente à tela inicial e permite que a frase apresentada seja obtida dinamicamente.

## 🛠️ Tecnologias utilizadas

- **Flutter**
- **Dart**

## 🎯 Objetivo do projeto

O projeto foi desenvolvido como prática de desenvolvimento mobile com Flutter, explorando principalmente:

- construção de interfaces mobile
- gerenciamento de estado
- navegação entre telas
- consumo de APIs externas
- tratamento de dados recebidos de APIs
- interação e feedback ao usuário
