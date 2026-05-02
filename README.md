# Fragment Rush: Corrida dos Cristais

Base inicial jogável em **Godot 4** para o jogo mobile de coleta & desvia.

## O que já vem pronto

- Menu inicial.
- Gameplay vertical mobile.
- Movimento por faixas.
- Controle por teclado e toque.
- Dash astral.
- Cristais coletáveis.
- Obstáculos procedurais.
- Sistema de colisão.
- Sistema de pontuação.
- Distância percorrida.
- Combo.
- Rasante Perfeito.
- Power-ups iniciais.
- Tela de resultado.
- Recorde local.
- Cristais salvos localmente.
- Loja/seleção de formas em estrutura inicial.
- Fundo cósmico procedural com estrelas, partículas e trilhas.

## Como abrir no Godot

1. Baixe e instale o **Godot 4.x**.
2. Abra o Godot.
3. Clique em **Importar**.
4. Selecione o arquivo `project.godot`.
5. Clique em **Executar**.

## Como usar no Codespace

1. Suba todos os arquivos deste ZIP no repositório `corrida-de-cristais`.
2. Abra o Codespace.
3. Edite os arquivos normalmente.
4. Para testar visualmente, abra o projeto no Godot local ou em ambiente com interface gráfica.

## Controles no PC

- Setas esquerda/direita ou A/D: trocar faixa.
- Espaço ou seta para baixo: dash.

## Controles no celular

- Arrastar para esquerda/direita: trocar faixa.
- Toque curto: dash.

## Arquitetura atualizada

O projeto foi reorganizado para ficar mais fácil de evoluir no **Godot 4**:

- `scripts/Main.gd`: loop principal, HUD, gameplay e drawing procedural.
- `scripts/core/FragmentContent.gd`: catálogo de formas, técnicas, biomas e progressão.
- `scripts/core/FragmentRunLogic.gd`: regras de XP, missões e progressão da corrida.
- `scripts/core/FragmentSave.gd`: persistência local e normalização do save.
- `scripts/ui/*`: telas modernas do menu, núcleo, pavilhão e componentes visuais reutilizáveis.
- `scenes/ui/*`: cenas separadas para a interface, prontas para expansão.

## Próximas melhorias recomendadas

1. Separar `Player`, `Obstacle`, `Crystal` e `GameManager` em cenas próprias.
2. Trocar os desenhos procedurais por sprites/VFX definitivos.
3. Adicionar áudio, feedback tátil e efeitos de UI para Android.
4. Evoluir a loja com raridades, efeitos passivos e preview de desbloqueio.
5. Criar missões diárias/semanais e metas de progressão.
6. Preparar export Android com ícone, splash e build assinado.
7. Integrar analytics, economia e live-ops se quiser publicar.
