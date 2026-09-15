#!/data/data/com.termux/files/usr/bin/bash
set -e

BASE="$HOME/.jihad-termux"
CONFIG="$BASE/config"
HASH_FILE="$BASE/.owner_pin_hash"

OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"

mkdir -p "$BASE"
chmod 700 "$BASE"

clear
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "        JIHAD BHAI MASTER TERMUX"
echo "          SECURE INSTALLER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

pkg update -y
pkg install -y coreutils git zsh curl ncurses-utils cmatrix

if [ ! -f "$HASH_FILE" ]; then
    echo "🔐 Create your Owner PIN"
    echo "PIN will not be saved as plain text."
    echo
    while true; do
        read -r -s -p "Enter new Owner PIN: " PIN1
        echo
        read -r -s -p "Confirm Owner PIN: " PIN2
        echo

        if [ -z "$PIN1" ]; then
            echo "❌ PIN cannot be empty."
            continue
        fi

        if [ "$PIN1" != "$PIN2" ]; then
            echo "❌ PINs do not match."
            continue
        fi

        printf '%s' "$PIN1" | sha256sum | awk '{print $1}' > "$HASH_FILE"
        unset PIN1 PIN2
        chmod 600 "$HASH_FILE"
        echo "✅ Owner PIN securely configured."
        break
    done
else
    echo "✅ Existing Owner PIN detected."
fi

cat > "$CONFIG" <<EOF
OWNER_NAME="$OWNER_NAME"
TELEGRAM="$TELEGRAM"
EOF
chmod 600 "$CONFIG"

cat > "$BASE/banner" <<'BANNER'
#!/data/data/com.termux/files/usr/bin/bash
BASE="$HOME/.jihad-termux"
[ -f "$BASE/config" ] && source "$BASE/config"
clear
echo
echo "╔══════════════════════════════════════════════════╗"
echo "║                                                  ║"
printf "║              %-32s║\n" "$OWNER_NAME"
echo "║                                                  ║"
echo "║              MASTER TERMUX                      ║"
echo "║                                                  ║"
echo "╠══════════════════════════════════════════════════╣"
printf "║  TELEGRAM : %-36s║\n" "$TELEGRAM"
echo "║                                                  ║"
echo "║  STATUS   : ● ONLINE                             ║"
echo "║  SHELL    : ZSH                                  ║"
echo "║                                                  ║"
echo "╚══════════════════════════════════════════════════╝"
echo
BANNER
chmod 755 "$BASE/banner"

cat > "$BASE/sysinfo" <<'SYSINFO'
#!/data/data/com.termux/files/usr/bin/bash
echo
echo "╔════════════════════════════════════════╗"
echo "║          SYSTEM INFORMATION            ║"
echo "╠════════════════════════════════════════╣"
printf "║ Date     : %-26s║\n" "$(date '+%Y-%m-%d')"
printf "║ Time     : %-26s║\n" "$(date '+%H:%M:%S')"
printf "║ User     : %-26s║\n" "$(whoami)"
printf "║ Shell    : %-26s║\n" "$SHELL"
echo "╚════════════════════════════════════════╝"
echo
SYSINFO
chmod 755 "$BASE/sysinfo"

cat > "$BASE/matrix" <<'MATRIX'
#!/data/data/com.termux/files/usr/bin/bash
cmatrix
MATRIX
chmod 755 "$BASE/matrix"

cat > "$BASE/owner" <<'OWNER'
#!/data/data/com.termux/files/usr/bin/bash
BASE="$HOME/.jihad-termux"
HASH_FILE="$BASE/.owner_pin_hash"
CONFIG="$BASE/config"

[ -f "$HASH_FILE" ] || { echo "❌ Owner PIN is not configured."; exit 1; }
source "$CONFIG"

echo
echo "╔════════════════════════════════════════╗"
echo "║          🔐 OWNER AUTHENTICATION       ║"
echo "╚════════════════════════════════════════╝"
echo

read -r -s -p "🔑 Owner PIN: " ENTERED_PIN
echo
ENTERED_HASH=$(printf '%s' "$ENTERED_PIN" | sha256sum | awk '{print $1}')
unset ENTERED_PIN
STORED_HASH=$(cat "$HASH_FILE")

if [ "$ENTERED_HASH" != "$STORED_HASH" ]; then
    unset ENTERED_HASH STORED_HASH
    echo "❌ Access Denied"
    exit 1
fi

unset ENTERED_HASH STORED_HASH
echo "✅ Access Granted"
echo

while true; do
    echo "╔════════════════════════════════════════╗"
    echo "║          👑 OWNER CONTROL PANEL       ║"
    echo "╠════════════════════════════════════════╣"
    echo "║ [1] Change Banner Name                ║"
    echo "║ [2] Change Telegram                   ║"
    echo "║ [3] Show Configuration                ║"
    echo "║ [4] Reset Banner                      ║"
    echo "║ [0] Exit                              ║"
    echo "╚════════════════════════════════════════╝"
    echo
    read -r -p "Select: " OPTION

    case "$OPTION" in
        1)
            read -r -p "New Banner Name: " NEW_NAME
            if [ -n "$NEW_NAME" ]; then
                sed -i "s/^OWNER_NAME=.*/OWNER_NAME=\"$NEW_NAME\"/" "$CONFIG"
                echo "✅ Banner name updated."
            fi
            ;;
        2)
            read -r -p "New Telegram: " NEW_TELEGRAM
            if [ -n "$NEW_TELEGRAM" ]; then
                sed -i "s/^TELEGRAM=.*/TELEGRAM=\"$NEW_TELEGRAM\"/" "$CONFIG"
                echo "✅ Telegram updated."
            fi
            ;;
        3)
            echo
            cat "$CONFIG"
            echo
            ;;
        4)
            sed -i 's/^OWNER_NAME=.*/OWNER_NAME="JIHAD BHAI"/' "$CONFIG"
            sed -i 's/^TELEGRAM=.*/TELEGRAM="@TEAM_XBD1M"/' "$CONFIG"
            echo "✅ Banner reset."
            ;;
        0)
            exit 0
            ;;
        *)
            echo "❌ Invalid option."
            ;;
    esac
    echo
done
OWNER
chmod 700 "$BASE/owner"

mkdir -p "$PREFIX/bin"
ln -sf "$BASE/banner" "$PREFIX/bin/banner"
ln -sf "$BASE/owner" "$PREFIX/bin/owner"
ln -sf "$BASE/sysinfo" "$PREFIX/bin/sysinfo"
ln -sf "$BASE/matrix" "$PREFIX/bin/matrix"

touch "$HOME/.zshrc"
if ! grep -q 'jihad-termux/banner' "$HOME/.zshrc" 2>/dev/null; then
cat >> "$HOME/.zshrc" <<'ZSH'

# JIHAD BHAI MASTER TERMUX
if [ -t 1 ]; then
    "$HOME/.jihad-termux/banner"
fi
ZSH
fi

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "        ✅ INSTALLATION COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "Commands: banner | owner | sysinfo | matrix"
echo
echo "Restart Termux or run: zsh"
echo
YLE="%s"\nBANNER_COLOR="%s"\n' "$OWNER_NAME" "$TELEGRAM" "$OWNER_PIN" "$BANNER_STYLE" "$BANNER_COLOR" > "$HOME/.jihad-termux/config" ;;
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
