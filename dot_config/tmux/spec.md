# Configuração do Tmux

## 1.0 Base geral da configuração

- Teste o tmux depois de cada alteração na configuração para garantir que tudo está funcionando corretamente
- Faça apenas o que está descrito aqui, não adicione nada que não esteja descrito
- Os arquivos de configuração devem ser salvos em ~/.config/tmux/
  - Plugins devem ser salvos em ~/.config/tmux/plugins/
  - Temas devem ser salvos em ~/.config/tmux/themes/
  - Arquivo principal de configuração deve ser salvo em ~/.config/tmux/tmux.conf
  - Defina para o tmux reconhecer o arquivo de configuração principal como ~/.config/tmux/tmux.conf
- Ative funções com o mouse
  - Interações com o mouse devem ser habilitadas para permitir a seleção de texto, redimensionamento de janelas e navegação entre painéis.
- O limite do histórico tem que ser de 10000 linhas, não quero demais para não travar o terminal
- A numeração das janelas deve ser reiniciada a cada nova sessão
- Os números da janelas devem começar em 1, não em 0
- O painel de status fica na parte superior da tela

## 2.0 uxterm

- Coloque o terminal para ter todas as cores do espectro de cores, para que o vim e o tmux funcionem bem com cores

## 3.0 Copiar e colar

- Ative o clipboard do sistema operacional para que seja possível copiar e colar entre o tmux e outros aplicativos
- Os atalhos de copiar e colar devem ser configurados para funcionar com o mouse e com o teclado
  - Os atalhos de teclado são os mesmos do vim, ou seja, `y` para copiar e `p` para colar
  - Para seleção de texto em bloco estilo nvim, use `<leader>v` para entrar no modo de seleção visual, e depois use `y` para copiar o texto selecionado

## 4.0 Atalhos de teclado

### 4.1 Geral

| Atalho | Ação |
| `<leader>r` | Recarrega configuração do tmux e exibe a mensagem "Configuração recarregada!"|

### 4.2 Janelas

| Atalho | Ação |
| `<leader>c` | Cria nova janela no path atual |
| `<leader>|` | Divide a janela verticalmente, a nova janela inicia no mesmo path que a anterior |
| `<leader>-` | Divide a janela horizontalmente, a nova janela inicia no mesmo path que a anterior |

### 4.3 Painéis

| Atalho | Ação |
| `<leader>l` | Muda o foco para o painel à direita |
| `<leader>h` | Muda o foco para o painel à esquerda |
| `<leader>k` | Muda o foco para o painel acima |
| `<leader>j` | Muda o foco para o painel abaixo |

## 5.0 Temas

- Os temas são carregados a partir do diretório ~/.config/tmux/themes/
- Os temas disponíveis são:
  - `rose-pine` - Tema inspirado no tema Rose Pine
  - `dracula` - Tema inspirado no tema Dracula
  - `gruvbox` - Tema inspirado no tema Gruvbox
  - `solarized` - Tema inspirado no tema Solarized
- Todos os temas seguem um template padrão, que define a aparência do painel de status, cores de fundo e cores de texto

### 5.1 Template do tema

- O template do tema define as cores e a aparência do painel de status, incluindo a cor de fundo, cor do texto, cor do destaque e cor do separador

### 5.2 Aparência do painel de status

- Cada janela na barra de status deve ter um ícone representando o tipo de aplicação que está rodando na janela, por exemplo:
  - `` para terminais
  - `` para navegadores
  - `` para gerenciadores de arquivos
  - `` para players de música
  - `` para visualizadores de imagens
  - `` para players de vídeo
  - `` para editores de código
  - `` para visualizadores de PDF
  - `` para clientes de email
  - `` para clientes de mensagens
  - `` para bancos de dados
- O espaçamento entre os ícones e o nome da janela deve ser de 1 caractere

### 5.3 Aparência das janelas

- O fundo do tmux deve ser transparente, permitindo que o fundo do terminal seja visível
- O fundo da aba da janela ativa deve ser destacado com uma cor diferente do fundo da aba das janelas inativas, a cor do texto da aba da janela ativa deve ser diferente da cor do texto das abas das janelas inativas
  - Cor de fundo da janela inativa pode ser a mesma cor do fundo do tmux
  - Cor de fundo da janela ativa deve ser uma cor que contraste com o fundo do tmux, sendo o background secundário do tema
  - Cor do texto da janela inativa deve ser a mesma cor do texto do tmux
  - Cor do texto da janela ativa deve ser uma cor diferente da cor do texto do tmux, sendo a cor de destaque do tema
- A numeração das janelas deve ser exibida antes do ícone da janela, sendo da mesma cor de destaque do tema, e deve ser exibida apenas para a janela ativa
- O espaçamento entre o ícone da janela e o número da janela deve ser de 1 caractere
- A cor das bordas do painel ativo dentro da janela ativa deve ser a mesma cor de destaque do tema, e a cor das bordas do painel ativo dentro das janelas inativas deve ser a mesma cor do fundo do tmux

### 5.4 Sessão

- O nome da sessão deve ser exibido no canto esquerdo do painel de status, sendo da mesma cor de destaque do tema
  - Fundo do nome da sessão deve ser a mesma cor do fundo do tmux
  - Texto e icone do nome da sessão devem ser da mesma cor de destaque do tema
  - Icone do nome da sessão deve ser ``

## 6.0 Plugins

- Só o tpm e tmux sensible são necessários, não quero mais nada
- O tpm deve ser instalado em ~/.config/tmux/plugins/tpm
  - git clone <https://github.com/tmux-plugins/tpm> ~/.tmux/plugins/tpm
- O tmux sensible deve ser instalado em ~/.config/tmux/plugins/tmux-sensible
