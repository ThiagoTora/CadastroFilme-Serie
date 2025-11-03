# 🎬 Cadastro e Listagem de Filmes/Séries (Flutter)

Este é um projeto de exemplo em Flutter que demonstra a criação de um aplicativo simples para cadastro, listagem e visualização de detalhes de filmes e séries. O projeto utiliza o conceito de gerenciamento de estado local (`StatefulWidget`) para armazenar os dados em memória enquanto a aplicação está em execução.

## ✨ Funcionalidades Principais

* **Cadastro Completo:** Formulário para inserção de informações detalhadas sobre um filme ou série.
* **Listagem Dinâmica:** Exibe todos os títulos cadastrados, com detalhes resumidos e imagem de capa.
* **Tela de Detalhes:** Apresenta todas as informações de um título, incluindo a sinopse e o status de visualização/recomendação.
* **Modelo de Dados Rico:** Cada registro inclui campos para nota (Slider), status de "Assistido" (Checkbox) e "Recomendaria" (Switch).
* **Navegação entre Telas:** Utilização do `Navigator` do Flutter para a transição entre as telas de Cadastro, Lista e Detalhes.

## ⚙️ Tecnologias e Dependências

O projeto foi construído utilizando a *framework* Flutter com as seguintes dependências principais:

| Pacote | Uso |
| :--- | :--- |
| **Flutter SDK** | Base para o desenvolvimento da aplicação. |
| `cupertino_icons` | Ícones para o estilo iOS. |

## 📦 Estrutura do Código

lib/
└── main.dart     # Contém:
                  # - main() e FilmesApp (ponto de entrada da aplicação)
                  # - Classe Filme (modelo de dados)
                  # - CadastroScreen (formulário de entrada de dados)
                  # - ListaScreen (listagem dos filmes/séries)
                  # - DetalhesScreen (visualização detalhada do item)

### Modelo de Dados (`Filme`)

A classe `Filme` define os dados armazenados para cada item:

* `titulo`: Título do filme/série.
* `diretor`: Diretor(a).
* `genero`: Gênero.
* `nota`: Classificação de 0 a 10 (double).
* `duracao`: Duração em minutos (int).
* `sinopse`: Breve descrição.
* `imagemUrl`: URL da imagem do cartaz.
* `assistido`: Status booleano (sim/não).
* `recomenda`: Status booleano (sim/não).

## 🚀 Como Rodar o Projeto

### Pré-requisitos

* [Flutter SDK](https://flutter.dev/docs/get-started/install) instalado.
* Um IDE de sua preferência (VS Code, Android Studio) com os plugins Flutter instalados.
* Um emulador ou dispositivo físico para rodar o app.

### Configuração

1.  **Clone o código:**
    ```bash
    git clone [URL_DO_SEU_REPOSITÓRIO]
    cd [pasta_do_projeto]
    ```

2.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

3.  **Execute a aplicação:**
    ```bash
    flutter run
    ```
    (Certifique-se de que um dispositivo ou emulador esteja conectado.)


