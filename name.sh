#!/bin/bash

# Clear terminal screen cleanly
clear

# Function for smooth typewriter animation
typewriter() {
    local text="$1"
    local delay="${2:-0.02}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

# Function for liquid loading animation
smooth_loader() {
    local duration=1.5
    local interval=0.1
    local steps=$((duration * 10))
    echo -ne "\e[1;36m[+] Initializing Engine: \e[0m"
    for ((i=0; i<=steps; i++)); do
        local pct=$((i * 100 / steps))
        local filled=$((i * 20 / steps))
        local empty=$((20 - filled))
        printf "\r\e[1;36m[+] Initializing Engine: \e[1;33m[\e[1;32m%s\e[1;30m%s\e[1;33m] %d%%\e[0m" "$(printf '█%.0s' $(seq 1 $filled 2>/dev/null))" "$(printf '░%.0s' $(seq 1 $empty 2>/dev/null))" "$pct"
        sleep $interval
    done
    echo ""
}

# Large Styled ASCII Banner & Author Tag
echo -e "\e[1;35m ████████╗ █████╗  ██████╗██╗███╗   ██╗\e[0m"
echo -e "\e[1;36m ╚══██╔══╝██╔══██╗██╔════╝██║████╗  ██║\e[0m"
echo -e "\e[1;34m    ██║   ███████║╚█████╗ ██║██╔██╗ ██║\e[0m"
echo -e "\e[1;32m    ██║   ██╔══██║ ╚═══██╗██║██║╚██╗██║\e[0m"
echo -e "\e[1;33m    ██║   ██║  ██║██████╔╝██║██║ ╚████║\e[0m"
echo -e "\e[1;31m    ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝\e[0m"
echo -e "\e[1;36m==================================================\e[0m"
typewriter "       ⚡ LINUX TERMINAL GRADIENT STYLER ⚡" 0.03
echo -e "\e[1;33m             Made by: iTzTasin69\e[0m"
echo -e "\e[1;36m==================================================\e[0m"
echo ""

# Strict string parsing engine
read -p "Enter Target Identity Style (e.g., root@tasin): " input_style

if [[ "$input_style" == *"*"* ]]; then
    user_part=$(echo "$input_style" | cut -d'@' -f1)
    host_part=$(echo "$input_style" | cut -d'@' -f2)
elif [[ "$input_style" == *"*"* ]]; then
    host_part="${input_style##*@}"
    user_part="${input_style%@*}"
else
    user_part="$input_style"
    host_part="tasin"
fi

# 1. Main Route Selection
echo ""
echo -e "\e[1;33mSelect Your Terminal Engine Path:\e[0m"
echo "--------------------------------------------------"
echo "1) Multi-Line Structural Templates (Kali Style without Emojis)"
echo "2) Custom True Color Gradients (No Brackets [ ], Continuous Fade)"
echo "--------------------------------------------------"
read -p "Enter Choice (1-2): " path_choice

if [[ "$path_choice" == "1" ]]; then
    # ==========================================
    # OPTION 1: STRUCTURAL TEMPLATES (KALI STYLE)
    # ==========================================
    echo ""
    echo -e "\e[1;33mSelect Structural Layout Preset:\e[0m"
    echo "1) Classic Kali Linux (Blue/White Multi-line) ┌── user@host"
    echo "2) Cyberpunk Edge     (Neon Pink/Cyan Multi-line)"
    echo "3) Matrix Overlord    (Pure Neon Green Multi-line)"
    read -p "Select Template (1-3): " structural_choice
    
    case $structural_choice in
        1)
            b_color="\[\e[38;2;70;130;180m\]"   # Steel Blue
            u_color="\[\e[38;2;220;20;60m\]"    # Crimson User
            h_color="\[\e[38;2;0;191;255m\]"   # Sky Blue Host
            p_color="\[\e[38;2;255;255;255m\]" # White Path
            s_color="\[\e[38;2;0;255;0m\]"      # Green $
            PS1_STRING="${b_color}┌──(${u_color}${user_part}${b_color}@${h_color}${host_part}${b_color})-[${p_color}\w${b_color}]\n└─${s_color}\\\$ \[\e[0m\]"
            ;;
        2)
            b_color="\[\e[38;2;148;0;211m\]"   # Violet
            u_color="\[\e[38;2;255;0;127m\]"    # Neon Pink User
            h_color="\[\e[38;2;0;255;255m\]"    # Neon Cyan Host
            p_color="\[\e[38;2;255;255;255m\]"
            s_color="\[\e[38;2;0;255;255m\]"
            PS1_STRING="${b_color}┌──(${u_color}${user_part}${b_color}@${h_color}${host_part}${b_color})-[${p_color}\w${b_color}]\n└─${s_color}➔ \[\e[0m\]"
            ;;
        3)
            b_color="\[\e[38;2;0;128;0m\]"     # Dark Green
            u_color="\[\e[38;2;57;255;20m\]"    # Neon Green User
            h_color="\[\e[38;2;127;255;212m\]" # Aquamarine Host
            p_color="\[\e[38;2;57;255;20m\]"
            s_color="\[\e[38;2;57;255;20m\]"
            PS1_STRING="${b_color}┌──(${u_color}${user_part}${b_color}@${h_color}${host_part}${b_color})-[${p_color}\w${b_color}]\n└─${s_color}# \[\e[0m\]"
            ;;
        *)
            PS1_STRING="\[\e[1;36m\]┌──(${user_part}@${host_part})─[\e[33m\w\e[1;36m]\n└─$ \[\e[0m\]"
            ;;
    esac

else
    # ==========================================
    # OPTION 2: TRUE GRADIENTS (NO BRACKETS)
    # ==========================================
    echo ""
    echo -e "\e[1;33mSelect True Color Gradient Scheme:\e[0m"
    echo "1) Cosmic Purple Fade (Deep Indigo ➔ Hot Pink)"
    echo "2) Sunset Ignition    (Fiery Red ➔ Electric Yellow)"
    echo "3) Cyber Toxic        (Emerald Green ➔ Bright Mint)"
    read -p "Select Gradient Option (1-3): " color_choice
    
    full_identity="${user_part}@${host_part}"
    len=${#full_identity}
    gradient_part=""

    case $color_choice in
        1) # Deep Purple to Pink Gradient
            r1=75; g1=0; b1=130
            r2=255; g2=105; b2=180
            path_c="\[\e[38;2;240;240;240m\]"
            sym_c="\[\e[38;2;0;255;255m\]"
            symbol_char="»"
            ;;
        2) # Red to Yellow Gradient
            r1=255; g1=0; b1=0
            r2=255; g2=215; b2=0
            path_c="\[\e[38;2;255;255;255m\]"
            sym_c="\[\e[38;2;255;69;0m\]"
            symbol_char="➔"
            ;;
        3) # Green to Cyan Gradient
            r1=0; g1=128; b1=0
            r2=0; g2=255; b2=255
            path_c="\[\e[38;2;200;255;200m\]"
            sym_c="\[\e[38;2;57;255;20m\]"
            symbol_char="#"
            ;;
        *)
            r1=0; g1=255; b1=255
            r2=255; g2=255; b2=255
            path_c="\[\e[0m\]"
            sym_c="\[\e[0m\]"
            symbol_char="$"
            ;;
    esac

    for ((i=0; i/dev/null 2>&1; then
    sudo hostnamectl set-hostname "$host_part" 2>/dev/null
fi
sudo hostname "$host_part" 2>/dev/null
sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$host_part/g" /etc/hosts 2>/dev/null

if [ -f /proc/sys/kernel/hostname ]; then
    echo "$host_part" | sudo tee /proc/sys/kernel/hostname >/dev/null 2>&1
fi

# Running visual engine generation script
smooth_loader

# Clean Profile and Inject Advanced Layout safely
sed -i '/# BEGIN ADVANCED PROFILE/,/# END ADVANCED PROFILE/d' ~/.bashrc

# Using literal quotes to prevent bash expanding sequences early
cat << 'EOT' >> ~/.bashrc

# BEGIN ADVANCED PROFILE
# File written dynamically by Tasin Terminal Engine Layout
EOT

# Direct literal variable injection to bypass bash multi-line formatting issues
echo "export PS1=\"${PS1_STRING}\"" >> ~/.bashrc

cat << 'EOT' >> ~/.bashrc
# END ADVANCED PROFILE
EOT

echo ""
echo -e "\e[1;32m[BOOM] Environment optimization complete.\e[0m"
echo -e "Execute: \e[1;33msource ~/.bashrc\e[0m to apply your new look instantly."
echo "=================================================="
