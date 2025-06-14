# 📱 PokéExplorer
## Sua Jornada no Mundo Pokémon!

---

## 🎯 Descrição
O **PokéExplorer** é um aplicativo iOS desenvolvido em **SwiftUI** que permite aos usuários explorar, visualizar detalhes e favoritar seus Pokémon favoritos.  
O app consome dados da **PokéAPI** em tempo real, permite **cadastro e autenticação** de usuários com persistência local via **SQLite**, e utiliza **Coordinator** para organizar a navegação.  
O projeto é responsivo, conta com **cache de imagens** e aplica **Design Tokens** para manter a consistência visual.

---

## 🔗 Tecnologias Utilizadas
- Swift
- SwiftUI
- MVVM (Model-View-ViewModel)
- Coordinator Pattern
- [PokéAPI](https://pokeapi.co)
- SQLite (Persistência local)
- Design Tokens
- Cache de imagens personalizado
- Animações fluidas
- Layout responsivo

---

## ✅ Funcionalidades
- ✅ Listagem de Pokémon em grid responsivo
- ✅ Detalhes completos do Pokémon (nome, imagem, tipo, peso, altura, habilidades, movimentos)
- ✅ Sistema de favoritos com persistência local
- ✅ Login e Cadastro com validação e redirecionamento
- ✅ Autenticação persistente
- ✅ Animações suaves para transições e interações
- ✅ Cache de imagens para otimização de carregamento
- ✅ Coordinator para navegação estruturada
- ✅ Design Tokens centralizados para visual consistente
- ✅ Layout adaptável para iPhone e iPad

---

## 📂 Estrutura do Projeto

```plaintext
ProjFinal-PokeExplorer
├── Coordinators
│   └── AppCoordinator.swift
├── Models
│   ├── Favorite.swift
│   ├── Pokemon.swift
│   ├── PokemonDetail.swift
│   └── User.swift
├── Resources
│   ├── DesignTokens.swift
│   └── ImageCache.swift
├── Services
│   ├── APIService.swift
│   ├── AuthService.swift
│   └── SQLiteService.swift
├── ViewModels
│   ├── FavoritesViewModel.swift
│   ├── LoginViewModel.swift
│   ├── PokemonDetailViewModel.swift
│   ├── PokemonListViewModel.swift
│   └── RegisterViewModel.swift
├── Views
│   ├── AsyncCachedImage.swift
│   ├── FavoritesView.swift
│   ├── LoginView.swift
│   ├── MainTabView.swift
│   ├── PokemonCardView.swift
│   ├── PokemonCell.swift
│   ├── PokemonDetailView.swift
│   ├── PokemonListView.swift
│   └── RegisterView.swift
├── AppDelegate.swift
├── SceneDelegate.swift
├── Info.plist
└── ViewController.swift
```

## 🧩 Arquitetura

O projeto segue o padrão **MVVM + Coordinator**.

```plaintext
View -> ViewModel -> Services
     ↘ Coordinator (navegação)
```

- **Views:** Interface gráfica.
- **ViewModels:** Conexão entre Views e lógica de negócio.
- **Services:** Chamadas de API, autenticação e persistência local.
- **Coordinator:** Gerencia toda a navegação da aplicação.

---

## 💾 Persistência de Dados

Persistência local utilizando **SQLite** via `SQLiteService`.

### Armazena:
- Usuários (nome, email, senha)
- Pokémon favoritos de cada usuário

---

## 🎨 Design Tokens

Os **Design Tokens** garantem:
- Paleta de cores consistente
- Tipografia padronizada
- Espaçamentos e bordas uniformes

### Exemplo:
```swift
enum DesignTokens {
    static let primaryColor = Color.blue
    static let cornerRadius: CGFloat = 12
    static let padding: CGFloat = 16
}
```
## 💡 Elementos de Criatividade

- ✔️ Cache de Imagens customizado para carregamento rápido
- ✔️ Coordinator Pattern para gestão de navegação

---

## 🚀 Como Rodar o Projeto

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/pokeexplorer.git
```
## Como Executar

1. Abra o projeto no Xcode.  
2. Execute no simulador ou em um dispositivo físico.

---

## 🎥 Demonstração em Vídeo

📺 [Link para vídeo no YouTube demonstrando o aplicativo](COLE_AQUI_O_LINK)

---

## 📚 Bibliotecas de Terceiros

Nenhuma. Todo o projeto foi implementado de forma nativa em Swift.

---

## ✍️ Contribuidores

Lucas Baumer
Matheus Kormann
Murilo Mayer

