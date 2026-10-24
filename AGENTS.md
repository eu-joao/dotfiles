# AGENTS.md

## Objetivo

Este repositório gerencia arquivos de configuração pessoais (*dotfiles*) com **chezmoi**. Preserve o comportamento existente e faça alterações pequenas, consistentes e fáceis de revisar.

## Estrutura e tecnologias

- Os arquivos seguem as convenções de nomes do chezmoi: `dot_*` representa arquivos ocultos no destino; `dot_config/` representa a árvore `~/.config/`.
- Arquivos com sufixo `.tmpl` são templates Go do chezmoi. Preserve a sintaxe e os dados de template, como `{{ .chezmoi.* }}`.
- Scripts `run_*` são scripts de automação executados pelo chezmoi. Verifique cuidadosamente seus efeitos colaterais antes de alterá-los ou executá-los.
- As configurações existentes incluem Zsh/Oh My Zsh, Homebrew/Brewfile, Neovim/LazyVim, tmux/TPM e Xresources. Há também configurações e temas organizados em `dot_config/` e `dot_tmux/`.
- O Brewfile declara pacotes do Homebrew, aplicativos Flatpak, fontes e uma extensão do VS Code. Não presuma que todos os itens estejam disponíveis em qualquer sistema.

## Regras para alterações

1. Leia o arquivo afetado e os arquivos relacionados antes de editar.
2. Respeite a organização, o idioma dos comentários e o estilo já usado no arquivo.
3. Prefira mudanças pontuais; não reformate arquivos inteiros nem substitua configurações por padrões genéricos sem necessidade.
4. Não invente dependências, caminhos, variáveis, opções ou requisitos de sistema. Confirme-os no repositório ou na documentação oficial quando necessário.
5. Não introduza caminhos absolutos específicos de uma máquina. Prefira `$HOME`, variáveis do chezmoi ou caminhos relativos apropriados.
6. Ao alterar configurações compartilhadas entre ferramentas, confira os arquivos que dependem delas (por exemplo, temas do tmux e arquivos de cores).
7. Não inclua segredos, tokens, credenciais ou dados pessoais nos arquivos versionados. Sinalize possíveis segredos encontrados sem reproduzi-los na resposta.

## ChezMoi e segurança

- Antes de propor mudanças, examine o resultado com `chezmoi diff` quando o ambiente permitir.
- Não execute `chezmoi apply`, scripts `run_*`, instalações, remoções ou comandos que alterem o sistema sem autorização explícita do usuário.
- Trate especialmente scripts que instalam pacotes ou reescrevem o Brewfile: entenda todos os comandos e efeitos antes de sugerir ou executar alterações.
- Não assuma que o ambiente atual corresponde ao caminho ou à máquina de quem mantém o repositório.

## Validação

- Valide apenas o que for relevante para a alteração e estiver disponível no ambiente.
- Para scripts Bash, use `bash -n` e, se instalado, ShellCheck.
- Para arquivos Zsh, valide a sintaxe com `zsh -n` se Zsh estiver disponível.
- Para templates, confira cuidadosamente a sintaxe e as variáveis do chezmoi; não tente validar um template como shell puro antes de renderizá-lo.
- Para configurações de ferramentas, use o verificador próprio da ferramenta quando disponível.
- Se não for possível executar uma validação, informe isso claramente; não declare que os testes passaram.

## Git e comunicação

- Não faça commit, push, merge ou criação de PR sem solicitação explícita.
- Não presuma que a branch de trabalho seja `main`.
- Quando um commit for solicitado, use uma mensagem clara e, se não houver convenção diferente no histórico, siga Conventional Commits.
- **Todo commit que incluir contribuição de uma IA deve incluir um trailer `Co-authored-by` identificando essa IA.** Use o nome e o endereço de e-mail de coautoria oficial/documentado pelo provedor ou pela ferramenta de IA; nunca invente uma identidade ou endereço. Se não houver uma identidade verificável disponível, peça ao usuário os dados corretos antes de criar o commit.
- Explique brevemente o que mudou, quais validações foram executadas e quaisquer limitações relevantes.
- Seja conciso e responda em português, salvo se o usuário solicitar outro idioma.
