#!/bin/bash

# ==============================================================================
# HYPRSENSEI AUDIO MANAGER SCRIPT (ROFI EDITION)
# Dependências: pulseaudio-utils (pactl), rofi-wayland, libnotify
# ==============================================================================

# 1. Coleta a lista de Sinks (Dispositivos de Saída)
# O awk continua sendo nosso filtro para unir ID numérico e Descrição
SINKS=$(pactl list sinks | grep -E 'Sink #|Description' | awk 'NR%2==1 {id=$2; gsub(/#/, "", id)} NR%2==0 {print id ": " substr($0, index($0,$2))}')

# 2. Exibe o menu usando o Rofi
# O parâmetro '-dmenu' transforma o Rofi em um leitor de listas.
# O parâmetro '-i' ignora maiúsculas/minúsculas na sua digitação.
# O parâmetro '-p' define o texto do prompt.
CHOSEN=$(echo "$SINKS" | rofi -dmenu -i -p "Selecione a Saída de Áudio:")

# 3. Processa a escolha
# Verifica se o usuário de fato escolheu algo e não cancelou o menu
if [ -n "$CHOSEN" ]; then
    
    # Extrai o número antes dos dois-pontos ':'
    SINK_ID=$(echo "$CHOSEN" | awk -F':' '{print $1}')
    
    # Executa a mudança de áudio via PipeWire/PulseAudio
    pactl set-default-sink "$SINK_ID"
    
    # Envia a notificação para o sistema
    notify-send -t 2500 "Hyprland Audio" "Saída alterada com sucesso:\n$CHOSEN"
    
fi
