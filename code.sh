#!/bin/bash

# ==========================================
# ULTIMATE VPS HOSTNAME CUSTOMIZER BY iTzTasin69
# ==========================================

# Animation Function
type_text() {
    local text="$1"
    local color="$2"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${color}${text:$i:1}\e[0m"
        sleep 0.04
    done
    echo ""
}

# Helper function to build gradient strings dynamically for PS1
build_gradient_ps1() {
    local text="$1"
    local r1=$2 g1=$3 b1=$4
    local r2=$5 g2=$6 b2=$7
    local len=${#text}
    local result=""
    for (( i=0; i<len; i++ )); do
        local ratio=$(( i * 100 / (len - 1) ))
        local r=$(( r1 + (r2 - r1) * ratio / 100 ))
        local g=$(( g1 + (g2 - g1) * ratio / 100 ))
        local b=$(( b1 + (b2 - b1) * ratio / 100 ))
        result+="\[\033[38;2;${r};${g};${b}m\]${text:$i:1}"
    done
    echo "$result"
}

# 1. Show Animated Intro and Ask for Custom Names
clear

# Smooth typing animation in Cyan
type_text "Welcome to Premium Vps Name Editor Made By iTzTasin69" "\e[1;36m"
echo ""

type_text "analysing data...." "\e[1;36m"
echo ""

type_text "&#*(!)#*$&$&@(Protected By iTzTasin69)" "\e[1;36m"
echo ""

type_text "Done!" "\e[1;36m"
echo ""

read -p "Enter your custom Username: " CUSTOM_USER
CUSTOM_USER=${CUSTOM_USER:-tasin}

read -p "Enter your custom Hostname: " CUSTOM_HOST
CUSTOM_HOST=${CUSTOM_HOST:-vps}

# Apply system hostname
sudo hostnamectl set-hostname $CUSTOM_HOST 2>/dev/null

# 2. Install figlet
echo -e "\e[33m[*] Installing required packages...\e[0m"
sudo apt-get update -qq > /dev/null 2>&1
sudo apt-get install -y figlet > /dev/null 2>&1

# 3. Pure Bash Gradient Function for the Banner
print_gradient() {
    local text="$1"
    local r1=$2 g1=$3 b1=$4
    local r2=$5 g2=$6 b2=$7
    local len=${#text}
    for (( i=0; i<len; i++ )); do
        local ratio=$(( i * 100 / (len - 1) ))
        local r=$(( r1 + (r2 - r1) * ratio / 100 ))
        local g=$(( g1 + (g2 - g1) * ratio / 100 ))
        local b=$(( b1 + (b2 - b1) * ratio / 100 ))
        printf "\e[38;2;%d;%d;%dm%s" $r $g $b "${text:$i:1}"
    done
    printf "\e[0m"
}

# 4. Show the Intro Banner (HARDCODED TO TASIN)
clear
if command -v figlet &> /dev/null; then
    FIGLET_OUTPUT=$(figlet "TASIN" 2>/dev/null || echo "TASIN")
    while IFS= read -r line; do
        print_gradient "$line" 0 255 255 255 0 255
        echo ""
    done <<< "$FIGLET_OUTPUT"
else
    print_gradient "TASIN" 0 255 255 255 0 255
    echo ""
fi

echo -e "\e[1;33m ⚡ Made By iTzTasin69 & Premium Name Editor Shell ⚡\e[0m"
echo ""

# 5. The Menu
echo -e "\e[1;36m╔══════════════════════════════════════╗"
echo -e "║        SELECT YOUR STYLE             ║"
echo -e "╠══════════════════════════════════════╣"
echo -e "║  1) 🎨 Normal Colors                ║"
echo -e "║  2) 🌈 Gradient Colors              ║"
echo -e "║  3) 💀 Hacker Templates             ║"
echo -e "║  4) 🧹 Clear / Reset to Default     ║"
echo -e "╚══════════════════════════════════════╝\e[0m"
read -p "Enter choice (1-4): " main_choice

NEW_PS1=''

case $main_choice in
    1)
        echo ""
        echo "Pick a Normal Color:"
        echo "1) 🔴 Red    2) 🟢 Green   3) 🟡 Yellow"
        echo "4) 🔵 Blue   5) 🟣 Purple  6) 🔵 Cyan    7) ⚪ White"
        read -p "Color choice (1-7): " color_choice
        
        case $color_choice in
            1) C='\[\033[1;31m\]';;   
            2) C='\[\033[1;32m\]';;   
            3) C='\[\033[1;33m\]';;   
            4) C='\[\033[1;34m\]';;   
            5) C='\[\033[1;35m\]';;   
            6) C='\[\033[1;36m\]';;   
            7) C='\[\033[1;37m\]';;   
            *) C='\[\033[1;32m\]';;   
        esac
        NEW_PS1="$C$CUSTOM_USER@$CUSTOM_HOST \[\033[0m\]\w # "
        ;;
    2)
        echo ""
        echo "Pick a Gradient Style:"
        echo "1) 🔥 Fire (Red -> Yellow)"
        echo "2) 🌌 Cyberpunk (Cyan -> Magenta)"
        echo "3) 💊 Matrix (Green -> White)"
        echo "4) 🌅 Sunset (Magenta -> Orange)"
        read -p "Gradient choice (1-4): " grad_choice
        
        TARGET_STR="${CUSTOM_USER}@${CUSTOM_HOST}"
        
        case $grad_choice in
            1) GRAD_STR=$(build_gradient_ps1 "$TARGET_STR" 255 0 0 255 255 0);;
            2) GRAD_STR=$(build_gradient_ps1 "$TARGET_STR" 0 255 255 255 0 255);;
            3) GRAD_STR=$(build_gradient_ps1 "$TARGET_STR" 0 255 0 200 255 200);;
            4) GRAD_STR=$(build_gradient_ps1 "$TARGET_STR" 255 0 150 255 160 0);;
            *) GRAD_STR=$(build_gradient_ps1 "$TARGET_STR" 0 255 255 255 0 255) ;;
        esac
        NEW_PS1="$GRAD_STR \[\033[0m\]\w # "
        ;;
    3)
        echo ""
        echo "Pick a Hacker Template:"
        echo "1) 🐉 Kali Linux Dragon Style (Red/Blue)"
        echo "2) 👻 Parrot OS Ghost Style (Green/Blue)"
        echo "3) 💀 Cyberpunk Hacker Style (Cyan/Magenta Box)"
        read -p "Template choice (1-3): " temp_choice
        
        case $temp_choice in
            1) NEW_PS1="┌──(\[\033[01;31m\]🐉 $CUSTOM_USER㉿$CUSTOM_HOST\[\033[0m\])-[\[\033[01;34m\]\w\[\033[0m\]]\n└─# ";;
            2) NEW_PS1="┌──(\[\033[01;32m\]👻 $CUSTOM_USER㉿$CUSTOM_HOST\[\033[0m\])-[\[\033[01;34m\]\w\[\033[0m\]]\n└─# ";;
            3) NEW_PS1="[\[\033[01;36m\]⚡ $CUSTOM_USER\[\033[0m\]@\[\033[01;35m\]$CUSTOM_HOST 💀\[\033[0m\]]:\[\033[01;34m\]\w\[\033[0m\]$ ";;
            *) NEW_PS1="┌──(\[\033[01;31m\]$CUSTOM_USER㉿$CUSTOM_HOST\[\033[0m\])-[\[\033[01;34m\]\w\[\033[0m\]]\n└─# " ;;
        esac
        ;;
    4)
        echo ""
        echo -e "\e[1;31m[!] Removing all custom configurations...\e[0m"
        cp ~/.bashrc.backup ~/.bashrc 2>/dev/null
        sudo hostnamectl set-hostname localhost 2>/dev/null
        clear
        echo "Reset complete. Restarting shell..."
        sleep 1
        exec bash
        exit 0
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

# 6. Backup and Apply to bashrc
cp ~/.bashrc ~/.bashrc.backup

# Remove old custom configurations to prevent duplicates
sed -i '/# TASIN CUSTOM CONFIG/,/# END TASIN CONFIG/d' ~/.bashrc

# Create the gradient banner function for bashrc
cat << 'BANNER_EOF' >> ~/.bashrc
# TASIN CUSTOM CONFIG
print_banner_gradient() {
    local text="$1"
    local r1=$2 g1=$3 b1=$4
    local r2=$5 g2=$6 b2=$7
    if command -v figlet &> /dev/null; then
        local FIG_OUTPUT=$(figlet "$text" 2>/dev/null || echo "$text")
    else
        local FIG_OUTPUT="$text"
    fi
    while IFS= read -r line; do
        local len=${#line}
        for (( i=0; i<len; i++ )); do
            local ratio=$(( i * 100 / (len - 1) ))
            local r=$(( r1 + (r2 - r1) * ratio / 100 ))
            local g=$(( g1 + (g2 - g1) * ratio / 100 ))
            local b=$(( b1 + (b2 - b1) * ratio / 100 ))
            printf "\e[38;2;%d;%d;%dm%s" $r $g $b "${line:$i:1}"
        done
        printf "\e[0m\n"
    done <<< "$FIG_OUTPUT"
}
BANNER_EOF

# Hardcode "TASIN" as the banner text, regardless of what they chose for the hostname
echo "print_banner_gradient 'TASIN' 0 255 255 255 0 255" >> ~/.bashrc
echo "echo -e '\e[1;33m⚡ Powered By Tasin & Premium Name Editor Shell ⚡\e[0m'"
echo "echo -e '\e[1;33m 💻 Welcome to Your Vps Terminal 💻\e[0m'" >> ~/.bashrc
echo "PS1='$NEW_PS1'" >> ~/.bashrc
echo "# END TASIN CONFIG" >> ~/.bashrc

clear
echo ""
echo -e "\e[1;32m╔══════════════════════════════════════╗"
echo -e "║          ✅ SETUP COMPLETE!          ║"
echo -e "╚══════════════════════════════════════╝\e[0m"
echo ""
echo "Restarting your terminal to apply the epicness..."
sleep 2

# Reload shell
exec bash
