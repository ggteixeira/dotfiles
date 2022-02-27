# Dotfiles

![desktop-screenshot](https://github.com/vibraniumdev/dotfiles/blob/main/media/desktop.png)

## Disclaimer

Se você está procurando meus dotfiles para o Manjaro i3wm ou para macOS, eles estão [aqui](https://github.com/vibraniumdev/i3wm-dotfiles) (Manjaro i3wm) e [aqui](https://github.com/vibraniumdev/macOS-Dotfiles) (macOS).

## Introdução: O que são Dotfiles e por que eles são importantes?

Como o nome já sugere, dotfiles são **arquivos** que têm como característica principal serem precedidos por um ponto (**dot** em inglês) em seus nomes. O ponto faz com que esses arquivos fiquem escondidos, evitando, assim, alterações ou exclusões acidentais. Outra característica deles é que eles geralmente são criados na pasta **home** do seu sistema de arquivos. O `.bashrc` é certamente o dotfile mais popular atualmente, pois ele é responsável pelas configurações do Bash (_Bourne-again shell_).

Usuários de sistemas _Unix-like_ utilizam dotfiles organizados em repositórios (como no GitHub, GitLab ou BitBucket) para manterem um esquema de versionamento de seus arquivos de configuração e um backup simples de ser ativado em caso de acidentes ou em máquinas novas. Outra utilidade de disponibilizar em repositórios públicos esses arquivos e screenshots é inspirar outros usuários a fazerem o mesmo e ampliar o conhecimento sobre essa técnica simples mas que poupa tempo e dor de cabeça.

Uma terceira utilidade seria majoritariamente estética, já que, nessa toada de personalização de configurações, existe um nicho de usuários que gostam de mostrar as personalizações feitas nos temas de seus terminais, editores de texto, _desktop environments_. Nas comunidades [r/vimporn](https://www.reddit.com/r/vimporn/) e [r/unixporn](https://www.reddit.com/r/unixporn/) você encontrará screenshots de usuários orgulhosos de terem transformado seu Vim e seu _desktop environment_ em verdadeiras obras de arte. Se quiser saber mais sobre esse tópico -- denominado _ricing_ --, tem um texto meu [aqui](https://medium.com/blacktech/introdução-ao-ricing-60243fab4275), postado no Medium, escrito em português.

## Processo de migração do Visual Studio Code para o Neovim

![nvim-screenshot](https://github.com/vibraniumdev/dotfiles/blob/main/media/nvim.png)

Lista de features essenciais presentes no VSCode

### Features básicas

### Mappings

### Workspaces

Usar o Vim no terminal – que é o meu caso – dispensa o conceito de workspace porque é mais direto ao ponto dar um `cd` na pasta de trabalho raiz e abrir o Vim lá. Há inclusive alguns aliases de navegação que facilitam ainda mais esse processo quando ele se torna repetitivo, como aliases do tipo `goto`: [.zsh_aliases](https://github.com/vibraniumdev/dotfiles/blob/main/.zsh_aliases).

### Ctrl+P/Command+P e Busca Global

Substituir o **ctrl+p** para buscar nomes de arquivos a partir da pasta-raiz de um projeto foi uma tarefa simples com o FZF. Utilizando os comandos `:Files` e `GFiles`, é possível implementar a mesma feature, com algumas opções a mais de aparência.

### Multi-Cursores

No Code é possível editar mais de uma linha por vez usando `ctrl+shift+seta` e editar palavras repetidas usando o `ctrl+d` . Para o Vim, usei por bastante tempo o plugin [vim-visual-multi](https://github.com/mg979/vim-visual-multi), pois ele tenta replicar essa funcionalidade e, na maior parte do tempo, consegue bem. Porém, um colega do grupo [Vim - Br](https://t.me/vimbr) (Telegram), você não precisa de plugin nenhum se aprender alguns feitiços escondidos debaixo do capô do próprio Vim. Este texto chamado [You don't need more than one cursor in Vim (Christoph Hermann)](https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db) ensina a utilizar três coisas:
1. O `cgn`;
2. Uma técnica que eu gosto bastante, de fazer o Vim nativamente editar várias linhas verticalmente ao mesmo tempo, assim como o Code faz. Essa funcionalidade, porém, possui algumas limitações, como, por exemplo, apenas funcionar se a edição for feita exatamente no início da linha. Se a edição for apagar caracteres, a tecla **delete** não vai funcionar, apenas o **backspace**.
3. Macros. As macros são o tipo de ferramenta que faz com que o Vim deixa os editores de texto normal comendo poeira. O poder delas é ilimitado, ainda mais se forem construídas utilizando recursão.
Utilizando esse texto, eu dispensei a extensão e passei a treinar os comandos nativos. A parte mais difícil são as macros avançadas; mas vale a pena; no Vim, tudo é um aprendizado constante.

### Auto Close Tag

Através do plugin [vim-closetag](https://github.com/alvan/vim-closetag) qualquer tag HTML aberta é automaticamente fechada depois que o usuário aperta `>`. No VSCode isso também precisa ser ativado via extensão, enquanto que no WebStorm o comportamento é nativo. Simples e poderoso.

### NERDTree

A NERDTree (árvore de arquivos) mostra dinamicamente o arquivo aberto, assim como o VSCode faz por padrão. A função que faz isso não é minha, copiei do [Bob Zimmermann](https://stackoverflow.com/a/59977029). Thanks!

### Informações na barra de status (statusline)

A statusline escolhida é a Lightline. Para mostrar a branch atual, foi utilizado o plugin vim-gitbranch.

### COC: Conquer of Completion

- `coc-tslint-plugin`
- `coc-tsserver`
- `coc-css`
- `coc-html`
- `coc-json`
- `coc-prettier`
- `coc-git`
- `coc-eslint`
- `coc-styled-components`
- `coc-emmet`

## Detalhes para lembrar de fazer

A lista completa de coisas ainda por fazer/consertar está [nas issues deste repositório](https://github.com/vibraniumdev/dotfiles/issues).

## Coisas que deram certo por meio de workarounds e adaptações

## Coisas que não deram certo

- Como eu uso o Vim dentro do terminal, alguns mappings colidem com os do sistema e com os do iTerm no Mac. Preciso criar uma categorização consistente de mappings. Precisa caber tudo e precisa ser mnemônico.

## Referências Bibliográficas (em construção)

### Dotfiles

- Dotfiles do Kent C. Dodds ([@kentcdodds](https://github.com/kentcdodds/dotfiles))
- Dotfiles do Juliano Faria ([@frontendwizard](https://github.com/frontendwizard/dotfiles))
- Dotfiles do Otavio Pace ([@otaviopace](https://github.com/otaviopace/dotfiles))
- Dotfiles do Greg Scheerlinck ([@greg-js](https://github.com/greg-js))

### Tutoriais

- [Do Yourself a favor and modularize your .vimrc/init.vim](https://www.gregjs.com/vim/2016/do-yourself-a-favor-and-modularize-your-vimrc-init-vim/) (Greg Scheerlinck)

### YouTube

- [Vim Plugin Highlight: fzf.vim! Fuzzy File Finding Fun!](https://www.youtube.com/watch?v=DpURGnb4Fyk) (Codevion)
- [How to Configure Vim Like VSCode](https://www.youtube.com/watch?v=gnupOrSEikQ) (Ben Awad)

### Reddit

---
