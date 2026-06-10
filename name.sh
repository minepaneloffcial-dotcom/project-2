#!/bin/bash

clear
echo -e "\e[1;36m==================================================\e[0m"
echo -e "\e[1;36m       LINUX TERMINAL PROFESSIONAL STYLER        \e[0m"
echo -e "\e[1;36m==================================================\e[0m"
echo ""

# 1. Get Input Layout
read -p "Enter Target Identity Style (e.g., root@user): " input_style

if [[ "$input_style" == *"@"* ]]; then
    user_part=$(echo "$input_style" | cut -d'@' -f1)
    host_part=$(echo "$input_style" | cut -d'@' -f2)
else
    user_part="$input_style"
    host_part="localhost"
fi

# 2. Display Templates
echo ""
echo -e "\e[1;33mSelect Your Professional Preset Theme:\e[0m"
echo "--------------------------------------------------"
echo "1) Kali Linux Style    (Deep Blue ➔ Slate Gray ➔ Dark Mode)"
echo "2) Hacker Matrix       (Neon Green ➔ Terminal Dark ➔ Cyber Mint)"
echo "3) Cyberpunk Neon      (Hot Pink ➔ Violet ➔ Neon Cyan)"
echo "4) Nord Ice            (Frost Blue ➔ Snow White ➔ Polar Blue)"
echo "5) Monokai Pro         (Bright Yellow ➔ Charcoal ➔ Salmon Orange)"
echo "--------------------------------------------------"
read -p "Enter theme number (1-5): " theme_choice

# 3. Configure Layout & Colors
# Uses specialized ANSI escape formatting for high-end professional appearance
case $theme_choice in
    1) # Kali Linux Style
        c1="\[\e[38;2;0;143;231m\]"    # Kali Light Blue
        c2="\[\e[38;2;112;128;144m\]"  # Slate Gray
        c3="\[\e[38;2;70;130;180m\]"   # Steel Blue
        path_c="\[\e[38;2;220;220;220m\]"
        symbol=" prompt; "
        ;;
    2) # Hacker Matrix
        c1="\[\e[38;2;57;255;20m\]"    # Neon Green
        c2="\[\e[38;2;0;128;0m\]"      # Dark Green
        c3="\[\e[38;2;127;255;212m\]"  # Aquamarine
        path_c="\[\e[38;2;0;255;0m\]"
        symbol=" # "
        ;;
    3) # Cyberpunk Neon
        c1="\[\e[38;2;255;0;127m\]"    # Pink/Magenta
        c2="\[\e[38;2;148;0;211m\]"    # Dark Violet
        c3="\[\e[38;2;0;255;255m\]"    # Cyan
        path_c="\[\e[38;2;255;255;255m\]"
        symbol=" ➔ "
        ;;
    4) # Nord Ice
        c1="\[\e[38;2;143;188;187m\]"  # Nord Mint
        c2="\[\e[38;2;129;161;193m\]"  # Nord Blue
        c3="\[\e[38;2;216;222;233m\]"  # Nord Snow
        path_c="\[\e[38;2;171;182;199m\]"
        symbol=" » "
        ;;
    5) # Monokai Pro
        c1="\[\e[38;2;255;216;102m\]"  # Monokai Yellow
        c2="\[\e[38;2;243;137;113m\]"  # Monokai Orange
        c3="\[\e[38;2;169;220;118m\]"  # Monokai Green
        path_c="\[\e[38;2;114;135;152m\]"
        symbol=" $ "
        ;;
    *) # Fallback Default
        c1="\[\e[38;2;0;255;255m\]"
        c2="\[\e[38;2;255;255;255m\]"
        c3="\[\e[38;2;0;255;255m\]"
        path_c="\[\e[38;2;255;255;255m\]"
        symbol=" # "
        ;;
esac

# 4. Process System Hostname Changes Cleanly
echo ""
echo -e "\e[1;32m[+] Modifying core engine parameters...\e[0m"
sudo hostnamectl set-hostname "$host_part"
sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$host_part/g" /etc/hosts

# 5. Clean Profile and Inject Clean Layout [user@host] ~ #
sed -i '/# BEGIN ADVANCED PROFILE/,/# END ADVANCED PROFILE/d' ~/.bashrc

cat << EOT >> ~/.bashrc

# BEGIN ADVANCED PROFILE
export PS1="\[\e[1m\][${c1}${user_part}${c2}@${c3}${host_part}\[\e[1m\]] ${path_c}\w${c1}${symbol}\[\e[0m\]"
# END ADVANCED PROFILE
EOT

echo ""
echo -e "\e[1;32m[BOOM] Environment optimization complete.\e[0m"
echo -e "Execute: \e[1;33msource ~/.bashrc\e[0m to initiate live changes."
echo "=================================================="
EOF
