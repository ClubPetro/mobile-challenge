# Desafio de Mobile

<img src="./img/logo-clubpetro.png" 
     alt="Clubpetro" width="300">

- [Descrição](#descrição)
  - [O Desafio](#o-desafio)
  - [Requisitos Obrigatórios](#requisitos-obrigatórios)
  - [Bônus](#bônus)
- [Submissão e Prazo de Entrega](#submissão-e-prazo-de-entrega)

## Descrição

Este desafio tem como objetivo avaliar as habilidades técnicas do candidato a vaga de desenvolvedor mobile no Clubpetro.

### O Desafio

O desafio consiste em construir um aplicativo de busca de pokémon, e visualizar as caracteristicas do pokémon pesquisado no período de **2 semanas**.

O aplicativo devera conter:
- Uma tela para realizar a pesquisa;
- Uma tela para exibir os resultados da pesquisa;
- Uma tela para exibir as caracteriscas dos pokémon;

#### Requisitos Obrigatórios

> Requisitos que serão avaliados no desafio.

- O Sistema deverá ser desenvolvido utilizando o framework [Flutter](https://flutter.dev/);

- O Layout utilizado dever ser seguido como base e pode ser encontrado no  [Figma](https://www.figma.com/file/W6jWGGCGz3qhun7TxTrVn4/Teste_pokemon?node-id=13%3A427) (é necessário logar no Figma para acessar as propriedades dos objetos das telas);

- Para o gerenciamento de estados utilize algum provider([BLoC](https://pub.dev/packages/bloc_provider), [GetX](https://pub.dev/packages/get), [MobX](https://pub.dev/packages/mobx));

- O Aplicativo deverá ser integrado à API [PokéAPI](https://pokeapi.co/) para a listagem dos pokémon. Esta conta com a imagem dos mesmos e as caracteristicas pedidas;



Caracteristicas obrigatórias que devem ser exibidas ao realizar a pesquisa:
- Evoluções
- Tipo(s)
- Imagem
- Nomes das Habilidades (Moves)
- Peso (Weight)
- Status base(Pelo menos 3)  - Exemplos: (HP, Attack, Defense, Speed)

**Obs:** Caso esteja aplicando para vaga de estagiario **NÃO** é necessario implementar a funcionalidade de favoritos.

#### Bônus

> Requisitos que não são obrigatórios mas podem te deixar em vantagem com relação aos outros candidatos.

- Exibir uma tela com a lista de todos os pokémon, fazendo uso de paginação para a construção da lista
- Incluir uma forma de favoritar o pokémon pesquisado.
- Exibir caracteristicas aleém das pedidas, porém tome CUIDADO com a forma que sera exibido para não ficar confuso;
### Submissão e Prazo de entrega

- O canditado deverá realizar um fork deste repositório e submeter o código no mesmo;
- Em caso do deploy realizado, a url deverá ser adicionada no README;
- O prazo de entrega para este desafio é de 2 (duas) semanas, contando a partir do dia em que o candidato recebeu o email com o link do repositório;

Em caso de dúvidas, enviar um e-mail para jobs@clubpetro.com.br
