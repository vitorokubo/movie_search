
# Movie Search

O projeto consiste em um aplicativo Android onde você pode buscar informações sobre filmes através da integração com a [OMDb API](https://www.omdbapi.com/). O projeto foi criado como requerimento para um processo seletivo.

# Como rodar a aplicação

Para isso, são necessários:

- SDK do Android  
- SDK do Flutter  
- Aparelho Android em modo desenvolvedor (caso queira rodá-lo em um aparelho. Também é possível executá-lo localmente no navegador em versão web).

Para rodar a aplicação, será necessário criar um arquivo **.env** conforme o exemplo **.env.example**, com sua `API_KEY` fornecida pela [OMDb API](https://www.omdbapi.com/).  
A chave será enviada por e-mail à equipe de seleção por segurança.

Após adicionar o arquivo `.env`, rode o comando no terminal:

```bash
flutter run
```

# Sobre o projeto

O projeto foi criado seguindo os requisitos exigidos, como a utilização das bibliotecas `Dio`, `Bloc` e `shared_preferences`, além da separação do projeto em camadas.  
Foram seguidas boas práticas como os princípios de *clean code* e separação de responsabilidades, em que a lógica de negócio foi isolada da interface de usuário utilizando o Bloc.

O resultado é um aplicativo simples, porém eficaz, para busca de filmes, com uma interface organizada e responsiva.

## ✅ Requisitos Cumpridos

### Funcionalidades

- [x] Tela de busca de filmes (campo de texto + botão de buscar)
- [x] Exibição dos resultados em uma lista com:
  - [x] Título
  - [x] Pôster
  - [x] Ano de lançamento
- [x] Tela de detalhes do filme com:
  - [x] Título
  - [x] Pôster em maior destaque
  - [x] Ano, gênero, sinopse
- [x] Armazenar localmente os últimos 5 filmes buscados
- [x] Exibir os últimos 5 filmes na aba "Recentes"

### Requisitos Técnicos

- [x] Flutter + Dart
- [x] Uso do `dio` para requisições
- [x] Gerência de estado com `Bloc`
- [x] Separação por camadas (mínimo: `data`, `domain`, `presentation`)
- [x] Persistência local com `shared_preferences` ou similar
- [x] Responsividade básica

## 🧪 Resultados Alcançados 

### Tela inicial  
<img src="./images/tela.png" />

### Após buscar filme  
<img src="./images/tela1.png" />

### Detalhes do filme  
<img src="./images/tela2.png" />

### Aba de recentes mostrando os últimos 5 filmes buscados  
<img src="./images/tela3.png" />

## 🗂 Organização das pastas

```
lib/
├── app/                          # Camada de regras de negócio e contratos
│   ├── data/                     # Lógica de aplicação e serviços
│   │   ├── models                # Models
│   │   ├── repositories          # Interfaces de repositórios (acesso a dados)
│   ├── domain/                   # Lógica de domínio da aplicação
│   │   ├── bloc                  # Entidades de domínio (conceitos de negócio)
│   │   ├── services/             # Regras de negócio
│   ├── presentation/             # Camada de apresentação (UI)
│   │   ├── screens               # Telas da aplicação
│   │   ├── theme                 # Configurações de tema (cores, fontes)
│   │   ├── widgets               # Componentes reutilizáveis de UI
test/                             # Testes automatizados
```

## 💡 Ideias para implementar

- Integração com Firebase para criação de contas e autenticação.  
- Uso de uma biblioteca específica para injeção de dependência.  
- Opção de marcar filmes como favoritos com salvamento local.  
- Aba dedicada para exibir os filmes favoritos.

