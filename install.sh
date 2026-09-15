#!/data/data/com.termux/files/usr/bin/bash
# ==============================================================================
# JIHAD BHAI MASTER TERMUX INSTALLER (install.sh)
# Single-file production-ready installer with Thick ASCII Renderer & Persistent Loop
# ==============================================================================

set -e

# Configuration Directories
CONFIG_DIR="$HOME/.jihad-termux"
CONFIG_FILE="$CONFIG_DIR/config.env"
BIN_DIR="$PREFIX/bin"

# Default Credentials & Settings
DEFAULT_OWNER="JIHAD BHAI"
DEFAULT_BANNER="JIHAD BHAI"
DEFAULT_TELEGRAM="@TEAM_XBD1M"
DEFAULT_COLOR="1"  # 1: Green
DEFAULT_PIN_HASH="c427ebca51f2f01f4639e450ee638f29bfbf9b09930867fb2179b009aebe1bf7" # SHA-256 for "25535"

# Colors Mapping
get_color_code() {
    case "$1" in
        1|Green)       echo "\033[1;32m" ;;
        2|Red)         echo "\033[1;31m" ;;
        3|Blue)        echo "\033[1;34m" ;;
        4|Yellow)      echo "\033[1;33m" ;;
        5|Purple)      echo "\033[1;35m" ;;
        6|Cyan)        echo "\033[1;36m" ;;
        7|White)       echo "\033[1;37m" ;;
        8|Orange)      echo "\033[38;5;208m" ;;
        9|Pink)        echo "\033[38;5;205m" ;;
        10|LightBlue)  echo "\033[38;5;117m" ;;
        *)             echo "\033[1;32m" ;;
    esac
}
NC="\033[0m"

# Ensure Infrastructure Directory Exists
mkdir -p "$CONFIG_DIR"
chmod 700 "$CONFIG_DIR"

# ------------------------------------------------------------------------------
# Package Installation Check
# ------------------------------------------------------------------------------
echo -e "\033[1;34m[*] Checking required packages...\033[0m"
REQUIRED_PKGS=(coreutils git zsh curl ncurses-utils cmatrix openssl)
MISSING_PKGS=()

for pkg in "${REQUIRED_PKGS[@]}"; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        MISSING_PKGS+=("$pkg")
    fi
done

if [ ${#MISSING_PKGS[@]} -gt 0 ]; then
    echo -e "\033[1;33m[*] Installing missing packages: ${MISSING_PKGS[*]}\033[0m"
    pkg update -y && pkg install -y "${MISSING_PKGS[@]}"
else
    echo -e "\033[1;32m[✓] All dependencies are already installed.\033[0m"
fi

# ------------------------------------------------------------------------------
# Embedded Dynamic Thick ASCII Renderer Engine
# ------------------------------------------------------------------------------
cat << 'EOF' > "$CONFIG_DIR/ascii_render.sh"
#!/data/data/com.termux/files/usr/bin/bash

TEXT=$(echo "$1" | tr 'a-z' 'A-Z')

l1=""; l2=""; l3=""; l4=""; l5=""

for (( i=0; i<${#TEXT}; i++ )); do
    char="${TEXT:$i:1}"
    case "$char" in
        A) l1+=" ██████  "; l2+="██    ██ "; l3+="████████ "; l4+="██    ██ "; l5+="██    ██ " ;;
        B) l1+="██████  "; l2+="██   ██ "; l3+="██████  "; l4+="██   ██ "; l5+="██████  " ;;
        C) l1+=" ██████  "; l2+="██       "; l3+="██       "; l4+="██       "; l5+=" ██████  " ;;
        D) l1+="██████   "; l2+="██   ██  "; l3+="██    ██ "; l4+="██   ██  "; l5+="██████   " ;;
        E) l1+="████████ "; l2+="██       "; l3+="██████   "; l4+="██       "; l5+="████████ " ;;
        F) l1+="████████ "; l2+="██       "; l3+="██████   "; l4+="██       "; l5+="██       " ;;
        G) l1+=" ██████  "; l2+="██       "; l3+="██   ████"; l4+="██    ██ "; l5+=" ██████  " ;;
        H) l1+="██    ██ "; l2+="██    ██ "; l3+="████████ "; l4+="██    ██ "; l5+="██    ██ " ;;
        I) l1+="████████ "; l2+="   ██    "; l3+="   ██    "; l4+="   ██    "; l5+="████████ " ;;
        J) l1+="   ██████"; l2+="      ██ "; l3+="      ██ "; l4+="██    ██ "; l5+=" ██████  " ;;
        K) l1+="██    ██ "; l2+="██   ██  "; l3+="██████   "; l4+="██   ██  "; l5+="██    ██ " ;;
        L) l1+="██       "; l2+="██       "; l3+="██       "; l4+="██       "; l5+="████████ " ;;
        M) l1+="██    ██ "; l2+="████████ "; l3+="██ ██ ██ "; l4+="██    ██ "; l5+="██    ██ " ;;
        N) l1+="██    ██ "; l2+="████  ██ "; l3+="██ ██ ██ "; l4+="██  ████ "; l5+="██    ██ " ;;
        O) l1+=" ██████  "; l2+="██    ██ "; l3+="██    ██ "; l4+="██    ██ "; l5+=" ██████  " ;;
        P) l1+="██████  "; l2+="██   ██ "; l3+="██████  "; l4+="██      "; l5+="██      " ;;
        Q) l1+=" ██████  "; l2+="██    ██ "; l3+="██    ██ "; l4+="██  ██   "; l5+=" ████ ██ " ;;
        R) l1+="██████  "; l2+="██   ██ "; l3+="██████  "; l4+="██   ██ "; l5+="██    ██ " ;;
        S) l1+=" ██████  "; l2+="██       "; l3+=" ██████  "; l4+="      ██ "; l5+="██████   " ;;
        T) l1+="████████ "; l2+="   ██    "; l3+="   ██    "; l4+="   ██    "; l5+="   ██    " ;;
        U) l1+="██    ██ "; l2+="██    ██ "; l3+="██    ██ "; l4+="██    ██ "; l5+=" ██████  " ;;
        V) l1+="██    ██ "; l2+="██    ██ "; l3+="██    ██ "; l4+=" ██  ██  "; l5+="   ██    " ;;
        W) l1+="██    ██ "; l2+="██    ██ "; l3+="██ ██ ██ "; l4+="████████ "; l5+="██    ██ " ;;
        X) l1+="██    ██ "; l2+=" ██  ██  "; l3+="   ██    "; l4+=" ██  ██  "; l5+="██    ██ " ;;
        Y) l1+="██    ██ "; l2+=" ██  ██  "; l3+="   ██    "; l4+="   ██    "; l5+="   ██    " ;;
        Z) l1+="████████ "; l2+="    ██   "; l3+="   ██    "; l4+="  ██     "; l5+="████████ " ;;
        0) l1+=" ██████  "; l2+="██  ████ "; l3+="██ ██ ██ "; l4+="████  ██ "; l5+=" ██████  " ;;
        1) l1+="  ████   "; l2+="    ██   "; l3+="    ██   "; l4+="    ██   "; l5+="████████ " ;;
        2) l1+=" ██████  "; l2+="██    ██ "; l3+="   ███   "; l4+="  ██     "; l5+="████████ " ;;
        3) l1+=" ██████  "; l2+="██    ██ "; l3+="  █████  "; l4+="██    ██ "; l5+=" ██████  " ;;
        4) l1+="██    ██ "; l2+="██    ██ "; l3+="████████ "; l4+="      ██ "; l5+="      ██ " ;;
        5) l1+="████████ "; l2+="██       "; l3+="███████  "; l4+="      ██ "; l5+="██████   " ;;
        6) l1+=" ██████  "; l2+="██       "; l3+="███████  "; l4+="██    ██ "; l5+=" ██████  " ;;
        7) l1+="████████ "; l2+="      ██ "; l3+="    ██   "; l4+="   ██    "; l5+="  ██     " ;;
        8) l1+=" ██████  "; l2+="██    ██ "; l3+=" ██████  "; l4+="██    ██ "; l5+=" ██████  " ;;
        9) l1+=" ██████  "; l2+="██    ██ "; l3+=" ███████ "; l4+="      ██ "; l5+=" ██████  " ;;
        "-") l1+="         "; l2+="         "; l3+="████████ "; l4+="         "; l5+="         " ;;
        " ") l1+="   "; l2+="   "; l3+="   "; l4+="   "; l5+="   " ;;
        *)  l1+=" "; l2+=" "; l3+=" "; l4+=" "; l5+=" " ;;
    esac
done

echo "$l1"
echo "$l2"
echo "$l3"
echo "$l4"
echo "$l5"
EOF

chmod 755 "$CONFIG_DIR/ascii_render.sh"

# ------------------------------------------------------------------------------
# Configuration Manager
# ------------------------------------------------------------------------------
save_config() {
    cat << EOF > "$CONFIG_FILE"
BANNER_NAME="$1"
TELEGRAM="$2"
COLOR_CODE="$3"
PIN_HASH="$4"
EOF
    chmod 600 "$CONFIG_FILE"
}

load_config() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    else
        BANNER_NAME="$DEFAULT_BANNER"
        TELEGRAM="$DEFAULT_TELEGRAM"
        COLOR_CODE="$DEFAULT_COLOR"
        PIN_HASH="$DEFAULT_PIN_HASH"
    fi
}

# ------------------------------------------------------------------------------
# First Time Banner Setup Form
# ------------------------------------------------------------------------------
load_config

if [ ! -f "$CONFIG_FILE" ] || [ "$FORCE_SETUP" = "true" ] || [ "$1" = "--force-setup" ]; then
    clear
    echo -e "\033[1;36m╔════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[1;36m║        🎨 FIRST TIME BANNER SETUP             ║\033[0m"
    echo -e "\033[1;36m╠════════════════════════════════════════════════╣\033[0m"
    echo -e "\033[1;36m║                                                ║\033[0m"
    echo -e "\033[1;36m║  Enter your Banner Name                        ║\033[0m"
    echo -e "\033[1;36m║                                                ║\033[0m"
    echo -e "\033[1;36m╚════════════════════════════════════════════════╝\033[0m"
    echo ""
    read -p "Banner Name: " INPUT_NAME

    # Clean input
    INPUT_NAME=$(echo "$INPUT_NAME" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
    
    if [ -z "$INPUT_NAME" ]; then
        BANNER_NAME="$DEFAULT_BANNER"
    else
        BANNER_NAME="$INPUT_NAME"
    fi

    save_config "$BANNER_NAME" "$DEFAULT_TELEGRAM" "$DEFAULT_COLOR" "$DEFAULT_PIN_HASH"

    echo ""
    echo -e "\033[1;32m✅ Banner Name Saved!\033[0m"
    echo ""
    echo "Your Banner:"
    COLOR=$(get_color_code "$DEFAULT_COLOR")
    echo -e "$COLOR"
    "$CONFIG_DIR/ascii_render.sh" "$BANNER_NAME"
    echo -e "$NC"
    sleep 2
fi

# ------------------------------------------------------------------------------
# Create Executable System Commands
# ------------------------------------------------------------------------------

# 1. banner command
cat << 'EOF' > "$BIN_DIR/banner"
#!/data/data/com.termux/files/usr/bin/bash
CONFIG_FILE="$HOME/.jihad-termux/config.env"
RENDER_SCRIPT="$HOME/.jihad-termux/ascii_render.sh"

if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    BANNER_NAME="JIHAD BHAI"
    COLOR_CODE="1"
fi

get_color_code() {
    case "$1" in
        1|Green)       echo "\033[1;32m" ;;
        2|Red)         echo "\033[1;31m" ;;
        3|Blue)        echo "\033[1;34m" ;;
        4|Yellow)      echo "\033[1;33m" ;;
        5|Purple)      echo "\033[1;35m" ;;
        6|Cyan)        echo "\033[1;36m" ;;
        7|White)       echo "\033[1;37m" ;;
        8|Orange)      echo "\033[38;5;208m" ;;
        9|Pink)        echo "\033[38;5;205m" ;;
        10|LightBlue)  echo "\033[38;5;117m" ;;
        *)             echo "\033[1;32m" ;;
    esac
}

COLOR=$(get_color_code "$COLOR_CODE")
NC="\033[0m"

echo -e "$COLOR"
"$RENDER_SCRIPT" "$BANNER_NAME"
echo -e "$NC"
EOF
chmod 755 "$BIN_DIR/banner"

# 2. sysinfo command
cat << 'EOF' > "$BIN_DIR/sysinfo"
#!/data/data/com.termux/files/usr/bin/bash
echo -e "\033[1;36m================ SYSTEM INFO ================\033[0m"
echo -e "\033[1;33mDevice Model : \033[0m$(getprop ro.product.model 2>/dev/null || echo 'Unknown')"
echo -e "\033[1;33mAndroid Ver  : \033[0m$(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')"
echo -e "\033[1;33mArchitecture : \033[0m$(uname -m)"
echo -e "\033[1;33mKernel Ver   : \033[0m$(uname -r)"
echo -e "\033[1;33mStorage Info : \033[0m$(df -h /data 2>/dev/null | tail -n1 | awk '{print $3 "/" $2 " used (" $5 ")"}')"
echo -e "\033[1;33mUptime       : \033[0m$(uptime -p 2>/dev/null || uptime)"
echo -e "\033[1;36m=============================================\033[0m"
EOF
chmod 755 "$BIN_DIR/sysinfo"

# 3. matrix command
cat << 'EOF' > "$BIN_DIR/matrix"
#!/data/data/com.termux/files/usr/bin/bash
cmatrix
EOF
chmod 755 "$BIN_DIR/matrix"

# 4. owner command (Owner Control Panel)
cat << 'EOF' > "$BIN_DIR/owner"
#!/data/data/com.termux/files/usr/bin/bash
CONFIG_FILE="$HOME/.jihad-termux/config.env"
RENDER_SCRIPT="$HOME/.jihad-termux/ascii_render.sh"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration missing! Please reinstall."
    exit 1
fi

source "$CONFIG_FILE"

# Authenticate PIN
read -sp "Enter Owner PIN: " ENTERED_PIN
echo ""

ENTERED_HASH=$(echo -n "$ENTERED_PIN" | openssl dgst -sha256 | awk '{print $NF}')

if [ "$ENTERED_HASH" != "$PIN_HASH" ]; then
    echo -e "\033[1;31m[✘] Access Denied: Incorrect PIN!\033[0m"
    exit 1
fi

echo -e "\033[1;32m[✓] Access Granted!\033[0m"
sleep 1

while true; do
    clear
    echo -e "\033[1;35m╔════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[1;35m║             👑 OWNER CONTROL PANEL             ║\033[0m"
    echo -e "\033[1;35m╠════════════════════════════════════════════════╣\033[0m"
    echo -e "\033[1;35m║ [1] Change Banner Name                         ║\033[0m"
    echo -e "\033[1;35m║ [2] Change Telegram                            ║\033[0m"
    echo -e "\033[1;35m║ [3] Change Banner Color                        ║\033[0m"
    echo -e "\033[1;35m║ [4] Preview Banner                             ║\033[0m"
    echo -e "\033[1;35m║ [5] Reset Banner                               ║\033[0m"
    echo -e "\033[1;35m║ [0] Exit                                       ║\033[0m"
    echo -e "\033[1;35m╚════════════════════════════════════════════════╝\033[0m"
    read -p "Select Option: " OPT

    case "$OPT" in
        1)
            read -p "Enter New Banner Name: " NEW_NAME
            NEW_NAME=$(echo "$NEW_NAME" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
            if [ -n "$NEW_NAME" ]; then
                BANNER_NAME="$NEW_NAME"
                sed -i "s/^BANNER_NAME=.*/BANNER_NAME=\"$BANNER_NAME\"/" "$CONFIG_FILE"
                echo -e "\033[1;32m[✓] Banner Name updated successfully!\033[0m"
            fi
            sleep 1.5
            ;;
        2)
            read -p "Enter New Telegram Handle: " NEW_TG
            if [ -n "$NEW_TG" ]; then
                TELEGRAM="$NEW_TG"
                sed -i "s/^TELEGRAM=.*/TELEGRAM=\"$TELEGRAM\"/" "$CONFIG_FILE"
                echo -e "\033[1;32m[✓] Telegram handle updated!\033[0m"
            fi
            sleep 1.5
            ;;
        3)
            clear
            echo "Select Color:"
            echo "1. Green       2. Red        3. Blue       4. Yellow"
            echo "5. Purple      6. Cyan       7. White      8. Orange"
            echo "9. Pink        10. Light Blue"
            read -p "Color Number (1-10): " COLOR_OPT
            if [[ "$COLOR_OPT" =~ ^[1-9]$|^10$ ]]; then
                COLOR_CODE="$COLOR_OPT"
                sed -i "s/^COLOR_CODE=.*/COLOR_CODE=\"$COLOR_CODE\"/" "$CONFIG_FILE"
                echo -e "\033[1;32m[✓] Color updated!\033[0m"
            else
                echo -e "\033[1;31mInvalid Selection!\033[0m"
            fi
            sleep 1.5
            ;;
        4)
            clear
            banner
            read -p "Press Enter to return..."
            ;;
        5)
            BANNER_NAME="JIHAD BHAI"
            TELEGRAM="@TEAM_XBD1M"
            COLOR_CODE="1"
            sed -i "s/^BANNER_NAME=.*/BANNER_NAME=\"$BANNER_NAME\"/" "$CONFIG_FILE"
            sed -i "s/^TELEGRAM=.*/TELEGRAM=\"$TELEGRAM\"/" "$CONFIG_FILE"
            sed -i "s/^COLOR_CODE=.*/COLOR_CODE=\"$COLOR_CODE\"/" "$CONFIG_FILE"
            echo -e "\033[1;32m[✓] Banner configuration reset to defaults!\033[0m"
            sleep 1.5
            ;;
        0)
            break
            ;;
        *)
            echo -e "\033[1;31mInvalid option!\033[0m"
            sleep 1
            ;;
    esac
done
EOF
chmod 755 "$BIN_DIR/owner"

# ------------------------------------------------------------------------------
# Auto Run in ZSH Startup Setup
# ------------------------------------------------------------------------------
ZSHRC="$HOME/.zshrc"
touch "$ZSHRC"

if ! grep -q "# JIHAD BHAI BANNER START" "$ZSHRC"; then
    cat << 'EOF' >> "$ZSHRC"

# JIHAD BHAI BANNER START
if [ -x "$PREFIX/bin/banner" ]; then
    banner
fi
# JIHAD BHAI BANNER END
EOF
fi

# ------------------------------------------------------------------------------
# Persistent Interactive Loop Screen (অনবরত চালু থাকবে)
# ------------------------------------------------------------------------------
load_config

while true; do
    clear
    echo -e "\033[1;32m╔════════════════════════════════════════════════╗\033[0m"
    echo -e "\033[1;32m║       ✅ INSTALLATION COMPLETE & ACTIVE       ║\033[0m"
    echo -e "\033[1;32m╚════════════════════════════════════════════════╝\033[0m"
    echo ""
    echo -e "🎨 Banner: \033[1;36m$BANNER_NAME\033[0m"
    echo -e "👑 Owner : \033[1;33m$DEFAULT_OWNER\033[0m"
    echo -e "📱 Telegram: \033[1;34m$TELEGRAM\033[0m"
    echo ""
    echo -e "\033[1;35mQuick Actions:\033[0m"
    echo "  [1] Show Banner"
    echo "  [2] Open Owner Panel"
    echo "  [3] System Info"
    echo "  [4] Matrix Animation"
    echo "  [5] Switch to ZSH Shell"
    echo "  [0] Exit Installer"
    echo ""
    read -p "Select Command Option (or press Ctrl+C to stay): " RUN_CMD

    case "$RUN_CMD" in
        1)
            clear
            banner
            echo ""
            read -p "Press Enter to return to main menu..."
            ;;
        2)
            owner
            ;;
        3)
            clear
            sysinfo
            echo ""
            read -p "Press Enter to return to main menu..."
            ;;
        4)
            matrix
            ;;
        5)
            echo -e "\033[1;32mStarting ZSH session...\033[0m"
            zsh
            ;;
        0)
            echo -e "\033[1;33mExiting installer script...\033[0m"
            exit 0
            ;;
        *)
            echo -e "\033[1;31mInvalid option!\033[0m"
            sleep 1
            ;;
    esac
done
