# Desafio Mobile - ClubPetro

Projeto Flutter desenvolvido para testar minhas habilidades, concorrendo a vaga de desenvolvedor mobile da ClubPetro.

## CheckList do que foi desenvolvido

#### Requisitos do Desafio

- [X] Uma tela para realizar a pesquisa;
- [X] Uma tela para exibir os resultados da pesquisa;
- [X] Uma tela para exibir as caracteriscas dos pokémon.

#### Requisitos Obrigatórios

- [x] O Sistema foi desenvolvido utilizando o framework [Flutter](https://flutter.dev/);
- [x] O Layout utilizado foi seguido como base no [Figma](https://www.figma.com/file/W6jWGGCGz3qhun7TxTrVn4/Teste_pokemon?node-id=13%3A427);
- [x] Para gerenciamento de estado foi utilizado o MobX;
- [x] O Aplicativo foi integrado à API [PokéAPI](https://pokeapi.co/) para a listagem dos pokémon.

#### Bônus

- [x] Foi Exibido uma tela com a lista de todos os pokémon, fazendo uso de paginação para a construção da lista;
- [x] Foi Incluido uma forma de favoritar o pokémon pesquisado;
- [x] Foi Exibido caracteristicas além das pedidas (Altura);

#### Extra Bônus

- [x] Deploy realizado, link: [Pokémon Challenge ClubPetro]().
- [x] Screen Splash.

## Sobre a arquitetura utilizada

Foi utilizado a arquitetura MVC, com repositories.

## Observação

As views foram divididas para Android e iOS com o intuito de preservar o ambiente do usuário em seu sistema operacional.
Porém, como há somente um layout (Acredito que deva ser seguido para os dois sistemas operacionais, apesar de me parecer com carecterísticas voltada para o Android), as únicas mudanças inseridas entre Android e iOS foram as transições de tela.
