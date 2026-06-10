cat << 'EOF' > ultimate_gradient.sh
#!/bin/bash

# Clear screen instantly to start animation frames
clear

# --- Smooth Frame-by-Frame Intro Animation ---
echo -e "\e[1;35m"
cat << "BAR"
▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
BAR
sleep 0.15

cat << "TITLE"
  _______ _____ _    _  _    _  _____   ____   _____  

 |__   __|_   _/ ____| \ | |/ ____| / __ \ / ____| 
    | |    | || (___ |  \| | |  __ | |  | | |  __  
    | |    | | \___ \| . ` | | |_ || |  | | | |_ | 
    | |   _| |_____) | |\  | |__| || |__| | |__| | 
    |_|  |_____|____/|_| \_|\_____(_)____/ \_____| 
                                                   
TITLE
sleep 0.2

echo -e "\e[1;36m       [ >> SYSTEM OPTIMIZATION ENGINE  ~/.bashrc

# BEGIN TASIN ULTIMATE
export PS1="\[\e[1m\][${user_grad}${at_sym}${host_grad}\[\e[1m\]] ${path_grad}${symbol}\[\e[0m\]"
# END TASIN ULTIMATE
EOT

# --- Outro Animation Sequencer ---
echo -e "\e[1;32m"
for i in {1..3}; do
    echo -ne "💥 BOOM! "
    sleep 0.15
done
echo -e "\n\e[0m"

echo -e "\e[1;35m==================================================\e[0m"
echo -e "\e[1;32m🔥 ENGINE OVERHAUL SUCCESSFUL BY iTzTasin69 🔥\e[0m"
echo -e "\e[1;36m👉 EXECUTE THIS RUNTIME REFRESH COMMAND NOW:\e[0m"
echo ""
echo -e "      \e[1;42;30m source ~/.bashrc \e[0m"
echo ""
echo -e "\e[1;35m==================================================\e[0m"
EOF
chmod +x ultimate_gradient.sh
