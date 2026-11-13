# Especificação do diretório atual

## 1. Visão geral
Este repositório está configurado como um conjunto de dotfiles para ambiente zsh/local, com foco em personalização do shell, aliases, prompt e integração com tools do sistema. O diretório não contém uma aplicação de software, serviço, biblioteca ou projeto de runtime; a finalidade principal é configurar o comportamento do terminal do usuário.

## 2. Mapeamento do diretório

### Diretório raiz
- `.git/`: metadados do repositório Git, histórico, refs, objetos e hooks.
- `.gitignore`: regras de exclusão locais para o repositório.
- `.zshrc`: arquivo central de configuração do shell zsh.
- `.zcompdump-notebook-5.9`: dump de completions do zsh gerado pelo sistema.
- `.zcompdump-notebook-5.9.zwc`: arquivo complementar de cache do dump de completions.
- `spec.md`: documento de especificação do diretório atual.

### Estrutura relevante observada
- O projeto é essencialmente um ambiente de shell customizado.
- Não há estruturas típicas de app (src/, app/, dist/, tests/, package.json, pyproject.toml, Cargo.toml, go.mod, Dockerfile, etc.).
- Não há código-fonte de aplicação nem módulos de negócio.

## 3. Objetivo funcional do projeto
O objetivo principal é definir a experiência de uso do shell zsh, incluindo:
- idioma e locale do ambiente (`pt_BR.UTF-8`);
- configuração de `PATH` e integração com Homebrew;
- ativação de Oh My Zsh e prompt Pure;
- aliases para navegação, edição de arquivos e uso de ferramentas;
- configuração do histórico do shell;
- integração com plugins de autocompletar e realce de sintaxe.

## 4. Arquivos principais

### `.zshrc`
Arquivo central com as configurações mais relevantes:
- exportação de `LANG` e `LC_ALL` para português do Brasil;
- configuração do editor para `nvim`;
- configuração do pager do manual com `bat`;
- adição de `$HOME/.local/bin` no `PATH`;
- carregamento do ambiente do Homebrew em `/home/linuxbrew/.linuxbrew/bin/brew`;
- customização do `fpath` para funções do zsh;
- habilitação do theme/prompt Pure;
- configuração do histórico (`HISTSIZE`, `SAVEHIST`, `HIST_IGNORE_DUPS`, `HIST_IGNORE_SPACE`, `SHARE_HISTORY`);
- aliases para navegação (`~`, `..`), listagem (`ls`, `l`, `lt`, `lg`), editor (`vi`, `vim`, `i`), e utilitários (`cat`, `dl`, `neofetch`);
- aliases Git (`gs`, `gc`, `gl`);
- carregamento de `fzf` e plugins de sugestões e destaque de sintaxe.

### `.gitignore`
Define arquivos e diretórios a serem ignorados pelo Git. A presença de `.zcompdump*` e outros artefatos comuns indica uso de shell e uso de cache de completions.

### `.zcompdump-notebook-5.9` e `.zcompdump-notebook-5.9.zwc`
Arquivos gerados automaticamente pelo zsh para armazenamento de compilações/completions e cache de shell.

## 5. Tecnologias e dependências observadas
- Shell: zsh
- Gerenciador de ambiente: Homebrew
- Framework/estrutura do shell: Oh My Zsh
- Prompt: Pure
- Ferramentas integradas: `fzf`, `bat`, `eza`, `yt-dlp`, `fastfetch`, plugins de autosuggestions e syntax-highlighting

## 6. Limitações e observações
- Não há indicadores de automação de build, testes ou deploy.
- O repositório está mais próximo de um ambiente local de dotfiles do que de um projeto de software.
- A configuração é específica do usuário/host, com caminhos absolutos como `/home/linuxbrew/.linuxbrew/bin/brew` e `/home/abacate/.oh-my-zsh`.

## 7. Status do projeto
Estado atual: configuração local de terminal personalizável e funcional, sem aplicação de negócio. O diretório foi mapeado e a especificação foi preenchida com base no que existe no repositório, sem modificar outros arquivos além deste documento.
