#!/data/data/com.termux/files/usr/bin/bash
set -e

BASE="$HOME/.jihad-termux"
CONFIG="$BASE/config"
mkdir -p "$BASE"

RESET='\033[0m'; BOLD='\033[1m'
GREEN='\033[38;5;46m'; CYAN='\033[38;5;51m'; PURPLE='\033[38;5;141m'
YELLOW='\033[38;5;226m'; RED='\033[38;5;196m'; WHITE='\033[38;5;255m'

[ -f "$CONFIG" ] || cat > "$CONFIG" <<'EOF'
OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"
OWNER_PIN="7860"
BANNER_STYLE="1"
BANNER_COLOR="46"
EOF

source "$CONFIG"

save_config() {
cat > "$CONFIG" <<EOF
OWNER_NAME="$OWNER_NAME"
TELEGRAM="$TELEGRAM"
OWNER_PIN="$OWNER_PIN"
BANNER_STYLE="$BANNER_STYLE"
BANNER_COLOR="$BANNER_COLOR"
EOF
}

show_banner() {
clear
echo
echo -e "${CYAN}${BOLD}"
echo "╭────────────────────────────────────────────────────────────╮"
echo "│              JIHAD BHAI // NEURAL CORE                    │"
echo "╰────────────────────────────────────────────────────────────╯"
echo -e "${RESET}\n"

echo -e "\033[38;5;${BANNER_COLOR}m${BOLD}"
case "$BANNER_STYLE" in
1) cat <<'ART'
     ██╗██╗██╗  ██╗ █████╗ ██████╗
     ██║██║██║  ██║██╔══██╗██╔══██╗
     ██║██║███████║███████║██║  ██║
██   ██║██║██╔══██║██╔══██║██║  ██║
╚█████╔╝██║██║  ██║██║  ██║██████╔╝
 ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
ART
;;
2) cat <<'ART'
╔╗ ╔╗╔═══╗╔═══╗╔═══╗╔══╗
║║ ║║║╔═╗║║╔══╝║╔══╝║╔╗║
║╚═╝║║╚═╝║║╚══╗║╚══╗║╚╝║
║╔═╗║║╔══╝║╔══╝║╔══╝║╔╗║
║║ ║║║║   ║╚══╗║╚══╗║║║║
╚╝ ╚╝╚╝   ╚═══╝╚═══╝╚╝╚╝
ART
;;
3) cat <<'ART'
██████╗ ██╗██╗  ██╗ █████╗ ██████╗
██╔══██╗██║██║  ██║██╔══██╗██╔══██╗
██████╔╝██║███████║███████║██║  ██║
██╔══██╗██║██╔══██║██╔══██║██║  ██║
██████╔╝██║██║  ██║██║  ██║██████╔╝
╚═════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
ART
;;
*) echo "████████████████████████████████"; echo "          $OWNER_NAME"; echo "████████████████████████████████";;
esac
echo -e "${RESET}\n"
echo -e "${PURPLE}${BOLD}              ◈ $OWNER_NAME ◈${RESET}"
echo -e "${CYAN}${BOLD}              ✈ Telegram : $TELEGRAM${RESET}"
echo -e "${GREEN}${BOLD}              ● STATUS   : ONLINE${RESET}\n"

IP=$(ip route get 1.1.1.1 2>/dev/null | grep -oE 'src [0-9.]+' | head -1 | awk '{print $2}' || true)
[ -z "$IP" ] && IP="Offline"
STORAGE=$(df -h "$HOME" 2>/dev/null | awk 'NR==2{print $4" free / "$2}' || echo "N/A")
RAM=$(free -m 2>/dev/null | awk 'NR==2{print $3" / "$2" MB}' || echo "N/A")

echo -e "${GREEN}${BOLD}"
echo "╭────────────────────────────────────────────────────────────╮"
echo "│                    SYSTEM STATUS                          │"
echo "├────────────────────────────────────────────────────────────┤"
echo "│  👑 OWNER       │ $OWNER_NAME"
echo "│  ✈ TELEGRAM    │ $TELEGRAM"
echo "│  🌐 NETWORK    │ $IP"
echo "│  💾 STORAGE    │ $STORAGE"
echo "│  🧠 MEMORY     │ $RAM"
echo "│  📅 DATE       │ $(date '+%d %B %Y')"
echo "│  ⏰ TIME       │ $(date '+%I:%M:%S %p')"
echo "│  🔐 CORE       │ PROTECTED"
echo "╰────────────────────────────────────────────────────────────╯"
echo -e "${RESET}\n"

echo -e "${CYAN}${BOLD}"
echo "╭────────────────────────────────────────────────────────────╮"
echo "│                    COMMAND DECK                            │"
echo "├────────────────────────────────────────────────────────────┤"
echo "│  banner    → Show Banner        owner   → Owner Control   │"
echo "│  sysinfo   → System Info        matrix  → Matrix Rain     │"
echo "│  prompts   → Prompt Center      reload  → Reload ZSH      │"
echo "╰────────────────────────────────────────────────────────────╯"
echo -e "${RESET}\n"
}

owner_panel() {
while true; do
clear
echo -e "${CYAN}${BOLD}"
echo "╭────────────────────────────────────────────────────────────╮"
echo "│                 🔐 OWNER CONTROL PANEL                    │"
echo "├────────────────────────────────────────────────────────────┤"
echo "│  [1] Change Banner Name                                    │"
echo "│  [2] Change Banner Style                                   │"
echo "│  [3] Change Banner Color                                   │"
echo "│  [4] Preview Banner                                        │"
echo "│  [5] Change Owner PIN                                      │"
echo "│  [6] Reset Banner                                          │"
echo "│  [0] Exit                                                  │"
echo "╰────────────────────────────────────────────────────────────╯"
echo -e "${RESET}"
read -rp "Select → " CHOICE
case "$CHOICE" in
1) read -rp "New Banner Name: " OWNER_NAME; [ -n "$OWNER_NAME" ] && save_config ;;
2) read -rp "Style [1-3]: " S; [[ "$S" =~ ^[123]$ ]] && BANNER_STYLE="$S" && save_config ;;
3) read -rp "Color [1=Green 2=Cyan 3=Blue 4=Purple 5=Pink 6=Yellow]: " C
case "$C" in 1) BANNER_COLOR=46;;2) BANNER_COLOR=51;;3) BANNER_COLOR=39;;4) BANNER_COLOR=141;;5) BANNER_COLOR=201;;6) BANNER_COLOR=226;;esac
save_config ;;
4) show_banner; read -rp "Press Enter..." ;;
5) read -rsp "New Owner PIN: " OWNER_PIN; echo; [ -n "$OWNER_PIN" ] && save_config ;;
6) OWNER_NAME="JIHAD BHAI"; BANNER_STYLE=1; BANNER_COLOR=46; save_config ;;
0) return ;;
*) echo -e "${RED}Invalid option${RESET}"; sleep 1 ;;
esac
done
}

cat > "$BASE/owner" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
source "$HOME/.jihad-termux/config"
read -rsp "Owner PIN: " INPUT; echo
[ "$INPUT" = "$OWNER_PIN" ] || { echo "ACCESS DENIED"; exit 1; }
source "$HOME/.jihad-termux/core"
owner_panel
EOF

cat > "$BASE/core" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
source "$HOME/.jihad-termux/config"
RESET='\033[0m'; BOLD='\033[1m'; CYAN='\033[38;5;51m'
show_banner() {
  bash "$HOME/.jihad-termux/banner"
}
owner_panel() {
  source "$HOME/.jihad-termux/panel"
}
EOF

cat > "$BASE/banner" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
source "$HOME/.jihad-termux/config"
source "$HOME/.jihad-termux/display"
show_banner
EOF

cat > "$BASE/display" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
source "$HOME/.jihad-termux/config"
show_banner() {
bash "$HOME/.jihad-termux/display_real"
}
EOF

cat > "$BASE/display_real" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
source "$HOME/.jihad-termux/config"
RESET='\033[0m'; BOLD='\033[1m'; CYAN='\033[38;5;51m'; GREEN='\033[38;5;46m'; PURPLE='\033[38;5;141m'
clear; echo
echo -e "${CYAN}${BOLD}╭────────────────────────────────────────────────────────────╮"
echo "│              JIHAD BHAI // NEURAL CORE                    │"
echo -e "╰────────────────────────────────────────────────────────────╯${RESET}\n"
echo -e "\033[38;5;${BANNER_COLOR}m${BOLD}"
case "$BANNER_STYLE" in
1) cat <<'ART'
     ██╗██╗██╗  ██╗ █████╗ ██████╗
     ██║██║██║  ██║██╔══██╗██╔══██╗
     ██║██║███████║███████║██║  ██║
██   ██║██║██╔══██║██╔══██║██║  ██║
╚█████╔╝██║██║  ██║██║  ██║██████╔╝
 ╚════╝ ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
ART
;;
2) echo "╔══════════════════════════════════════════════════════════╗"; echo "║                    $OWNER_NAME"; echo "╚══════════════════════════════════════════════════════════╝";;
3) echo "████████████████████████████████████████"; echo "            $OWNER_NAME"; echo "████████████████████████████████████████";;
esac
echo -e "${RESET}\n${PURPLE}${BOLD}              ◈ $OWNER_NAME ◈${RESET}"
echo -e "${CYAN}${BOLD}              ✈ Telegram : $TELEGRAM${RESET}"
echo -e "${GREEN}${BOLD}              ● STATUS   : ONLINE${RESET}\n"
echo -e "${GREEN}${BOLD}╭────────────────────────────────────────────────────────────╮"
echo "│                    SYSTEM STATUS                          │"
echo "├────────────────────────────────────────────────────────────┤"
echo "│  👑 OWNER       │ $OWNER_NAME"
echo "│  ✈ TELEGRAM    │ $TELEGRAM"
echo "│  📅 DATE       │ $(date '+%d %B %Y')"
echo "│  ⏰ TIME       │ $(date '+%I:%M:%S %p')"
echo "│  🔐 CORE       │ PROTECTED"
echo "╰────────────────────────────────────────────────────────────╯"
echo -e "${RESET}\n"
EOF

cat > "$BASE/panel" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
source "$HOME/.jihad-termux/config"
while true; do
clear
echo "╭────────────────────────────────────────────────────────────╮"
echo "│                 🔐 OWNER CONTROL PANEL                    │"
echo "├────────────────────────────────────────────────────────────┤"
echo "│ [1] Change Banner Name                                    │"
echo "│ [2] Change Banner Style                                   │"
echo "│ [3] Change Banner Color                                   │"
echo "│ [4] Preview Banner                                        │"
echo "│ [5] Change Owner PIN                                      │"
echo "│ [6] Reset Banner                                          │"
echo "│ [0] Exit                                                  │"
echo "╰────────────────────────────────────────────────────────────╯"
read -rp "Select → " CHOICE
case "$CHOICE" in
1) read -rp "New Banner Name: " OWNER_NAME; [ -n "$OWNER_NAME" ] && printf 'OWNER_NAME="%s"\nTELEGRAM="%s"\nOWNER_PIN="%s"\nBANNER_STYLE="%s"\nBANNER_COLOR="%s"\n' "$OWNER_NAME" "$TELEGRAM" "$OWNER_PIN" "$BANNER_STYLE" "$BANNER_COLOR" > "$HOME/.jihad-termux/config" ;;
2) read -rp "Style [1-3]: " S; [[ "$S" =~ ^[123]$ ]] && BANNER_STYLE="$S"; source "$HOME/.jihad-termux/config"; printf 'OWNER_NAME="%s"\nTELEGRAM="%s"\nOWNER_PIN="%s"\nBANNER_STYLE="%s"\nBANNER_COLOR="%s"\n' "$OWNER_NAME" "$TELEGRAM" "$OWNER_PIN" "$BANNER_STYLE" "$BANNER_COLOR" > "$HOME/.jihad-termux/config" ;;
3) read -rp "Color [46/51/39/141/201/226]: " C; [[ "$C" =~ ^(46|51|39|141|201|226)$ ]] && BANNER_COLOR="$C"; printf 'OWNER_NAME="%s"\nTELEGRAM="%s"\nOWNER_PIN="%s"\nBANNER_STYLE="%s"\nBANNER_COLOR="%s"\n' "$OWNER_NAME" "$TELEGRAM" "$OWNER_PIN" "$BANNER_STYLE" "$BANNER_COLOR" > "$HOME/.jihad-termux/config" ;;
4) bash "$HOME/.jihad-termux/banner"; read -rp "Press Enter..." ;;
5) read -rsp "New PIN: " OWNER_PIN; echo; [ -n "$OWNER_PIN" ] && printf 'OWNER_NAME="%s"\nTELEGRAM="%s"\nOWNER_PIN="%s"\nBANNER_STYLE="%s"\nBANNER_COLOR="%s"\n' "$OWNER_NAME" "$TELEGRAM" "$OWNER_PIN" "$BANNER_STYLE" "$BANNER_COLOR" > "$HOME/.jihad-termux/config" ;;
6) OWNER_NAME="JIHAD BHAI"; BANNER_STYLE=1; BANNER_COLOR=46; printf 'OWNER_NAME="%s"\nTELEGRAM="%s"\nOWNER_PIN="%s"\nBANNER_STYLE="%s"\nBANNER_COLOR="%s"\n' "$OWNER_NAME" "$TELEGRAM" "$OWNER_PIN" "$BANNER_STYLE" "$BANNER_COLOR" > "$HOME/.jihad-termux/config" ;;
0) exit ;;
esac
done
EOF

cat > "$BASE/sysinfo" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
echo "╭──────── SYSTEM INFORMATION ────────╮"
echo "│ Kernel : $(uname -r)"
echo "│ Arch   : $(uname -m)"
echo "│ Shell  : $SHELL"
echo "│ Time   : $(date '+%H:%M:%S')"
echo "╰─────────────────────────────────────╯"
EOF

cat > "$BASE/matrix" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
command -v cmatrix >/dev/null 2>&1 && cmatrix -C green || echo "Install cmatrix first."
EOF

cat > "$BASE/prompts" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash
echo "╭──────── PROMPT CENTER ────────╮"
echo "│ 01 Neon Core                  │"
echo "│ 02 Cyber HUD                  │"
echo "│ 03 Classic Terminal           │"
echo "╰───────────────────────────────╯"
EOF

chmod +x "$BASE"/*

pkg update -y >/dev/null 2>&1 || true
pkg install -y zsh git curl ncurses-utils cmatrix >/dev/null 2>&1 || true

[ -d "$HOME/.oh-my-zsh" ] || git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" >/dev/null 2>&1 || true
CUSTOM="$HOME/.oh-my-zsh/custom"
[ -d "$CUSTOM/plugins/zsh-autosuggestions" ] || git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git "$CUSTOM/plugins/zsh-autosuggestions" >/dev/null 2>&1 || true
[ -d "$CUSTOM/plugins/zsh-syntax-highlighting" ] || git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$CUSTOM/plugins/zsh-syntax-highlighting" >/dev/null 2>&1 || true

[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$HOME/.zshrc.jihad-backup"

cat > "$HOME/.zshrc" <<'EOF'
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"
export TERM="xterm-256color"
JB="$HOME/.jihad-termux"
alias banner="bash $JB/banner"
alias owner="bash $JB/owner"
alias sysinfo="bash $JB/sysinfo"
alias matrix="bash $JB/matrix"
alias prompts="bash $JB/prompts"
alias reload="source ~/.zshrc"
alias cls="clear && bash $JB/banner"
PROMPT='%F{46}%B╭─[%F{51}JIHAD BHAI%F{46}]─[%F{141}%~%F{46}]─[%F{226}%D{%H:%M}%F{46}]%b
%F{46}╰─%F{51}❯%f '
if [[ -o interactive ]]; then bash "$JB/banner"; fi
EOF

echo
echo -e "${GREEN}${BOLD}✓ JIHAD BHAI MASTER TERMUX INSTALLED${RESET}"
echo -e "${CYAN}Telegram: @TEAM_XBD1M${RESET}"
echo -e "${YELLOW}Owner PIN: 7860${RESET}"
echo
exec zsh
