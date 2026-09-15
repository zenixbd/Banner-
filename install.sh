#!/data/data/com.termux/files/usr/bin/bash
set -e

# ============================================================
# JIHAD BHAI MASTER TERMUX
# AUTO DEPENDENCY INSTALLER + SECURE OWNER PANEL
# ============================================================

BASE="$HOME/.jihad-termux"
CONFIG="$BASE/config"
HASH_FILE="$BASE/.owner_pin_hash"
COLOR_FILE="$BASE/.banner_color"

OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"

# SHA-256 of Owner PIN: 25535
OWNER_PIN_HASH="c6c9686891996d754575c6330ec5049ee18eea3379652cc47908c3b9d768c837"

clear

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "             JIHAD BHAI MASTER TERMUX"
echo "             AUTO INSTALL SYSTEM"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# ============================================================
# TERMUX CHECK
# ============================================================

if ! command -v pkg >/dev/null 2>&1; then
    echo "❌ এই ফাইলটি শুধুমাত্র Termux-এ চালাতে হবে।"
    exit 1
fi

# ============================================================
# AUTO DEPENDENCY INSTALL
# ============================================================

echo "📦 Checking required packages..."
echo

pkg update -y

PACKAGES=(
    coreutils
    git
    zsh
    curl
    ncurses-utils
    cmatrix
)

for PACKAGE in "${PACKAGES[@]}"; do

    if dpkg -s "$PACKAGE" >/dev/null 2>&1; then
        echo "✅ $PACKAGE already installed"
    else
        echo "📥 Installing $PACKAGE..."
        pkg install -y "$PACKAGE"
    fi

done

echo
echo "✅ সব required package প্রস্তুত।"
echo

# ============================================================
# CREATE SYSTEM DIRECTORY
# ============================================================

echo "📁 Creating JIHAD BHAI system..."

mkdir -p "$BASE"

chmod 700 "$BASE"

# ============================================================
# SECURE PIN
# ============================================================

printf '%s\n' "$OWNER_PIN_HASH" > "$HASH_FILE"

chmod 600 "$HASH_FILE"

# ============================================================
# CONFIG
# ============================================================

cat > "$CONFIG" <<EOF
OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"
EOF

chmod 600 "$CONFIG"

# Default Green
printf '1;32\n' > "$COLOR_FILE"

chmod 600 "$COLOR_FILE"

# ============================================================
# DYNAMIC THICK ASCII BANNER ENGINE
# ============================================================

cat > "$BASE/render_banner" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/.jihad-termux"

source "$BASE/config"

declare -A A

A[A]=' █████╗
██╔══██╗
███████║
██╔══██║
██║  ██║'

A[B]='██████╗
██╔══██╗
██████╔╝
██╔══██╗
██████╔╝'

A[C]=' ██████╗
██╔════╝
██║
██║
╚██████╗'

A[D]='██████╗
██╔══██╗
██║  ██║
██║  ██║
██████╔╝'

A[E]='███████╗
██╔════╝
█████╗
██╔════╝
███████╗'

A[F]='███████╗
██╔════╝
█████╗
██╔════╝
██║'

A[G]=' ██████╗
██╔════╝
██║  ███╗
██║   ██║
╚██████╔╝'

A[H]='██╗  ██╗
██║  ██║
███████║
██╔══██║
██║  ██║'

A[I]='██╗
██║
██║
██║
██║'

A[J]='     ██╗
     ██║
     ██║
██   ██║
╚█████╔╝'

A[K]='██╗  ██╗
██║ ██╔╝
█████╔╝
██╔═██╗
██║  ██╗'

A[L]='██╗
██║
██║
██║
███████╗'

A[M]='███╗   ███╗
████╗ ████║
██╔████╔██║
██║╚██╔╝██║
██║ ╚═╝ ██║'

A[N]='███╗   ██╗
████╗  ██║
██╔██╗ ██║
██║╚██╗██║
██║ ╚████║'

A[O]=' ██████╗
██╔═══██╗
██║   ██║
██║   ██║
╚██████╔╝'

A[P]='██████╗
██╔══██╗
██████╔╝
██╔═══╝
██║'

A[Q]=' ██████╗
██╔═══██╗
██║   ██║
██║▄▄ ██║
╚██████╔╝'

A[R]='██████╗
██╔══██╗
██████╔╝
██╔══██╗
██║  ██║'

A[S]='███████╗
██╔════╝
███████╗
╚════██║
███████║'

A[T]='████████╗
╚══██╔══╝
   ██║
   ██║
   ██║'

A[U]='██╗   ██╗
██║   ██║
██║   ██║
██║   ██║
╚██████╔╝'

A[V]='██╗   ██╗
██║   ██║
██║   ██║
╚██╗ ██╔╝
 ╚████╔╝'

A[W]='██╗    ██╗
██║    ██║
██║ █╗ ██║
██║███╗██║
╚███╔███╔╝'

A[X]='██╗  ██╗
╚██╗██╔╝
 ╚███╔╝
 ██╔██╗
██╔╝ ██╗'

A[Y]='██╗   ██╗
╚██╗ ██╔╝
 ╚████╔╝
  ╚██╔╝
   ██║'

A[Z]='███████╗
╚════██║
   ███╔╝
 ██╔╝
███████╗'

A[0]=' ██████╗
██╔═████╗
██║██╔██║
████╔╝██║
╚██████╔╝'

A[1]=' ██╗
███║
╚██║
 ██║
 ██║'

A[2]='██████╗
╚════██╗
 █████╔╝
██╔═══╝
███████╗'

A[3]='██████╗
╚════██╗
 █████╔╝
╚════██╗
██████╔╝'

A[4]='██╗  ██╗
██║  ██║
███████║
╚════██║
     ██║'

A[5]='███████╗
██╔════╝
███████╗
╚════██║
███████║'

A[6]=' ██████╗
██╔════╝
███████╗
██╔══██║
╚██████╔╝'

A[7]='███████╗
╚════██║
    ██╔╝
   ██╔╝
   ██║'

A[8]=' █████╗
██╔══██╗
╚█████╔╝
██╔══██╗
╚█████╔╝'

A[9]=' █████╗
██╔══██╗
╚██████║
╚════██║
██████╔╝'

NAME=$(printf '%s' "$OWNER_NAME" | tr '[:lower:]' '[:upper:]')

for ((ROW=0; ROW<5; ROW++)); do

    LINE=""

    for ((I=0; I<${#NAME}; I++)); do

        CHAR="${NAME:I:1}"

        BLOCK="${A[$CHAR]}"

        if [ -n "$BLOCK" ]; then
            PART=$(printf '%s\n' "$BLOCK" | sed -n "$((ROW+1))p")
        else
            PART="     "
        fi

        LINE="${LINE}${PART}  "

    done

    printf '%s\n' "$LINE"

done
EOF

chmod 700 "$BASE/render_banner"

# ============================================================
# BANNER COMMAND
# ============================================================

cat > "$BASE/banner" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/.jihad-termux"

source "$BASE/config"

COLOR_CODE="1;32"

if [ -f "$BASE/.banner_color" ]; then
    COLOR_CODE=$(cat "$BASE/.banner_color")
fi

clear

printf '\033[%sm' "$COLOR_CODE"

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

"$BASE/render_banner"

echo

printf '\033[1;37m'

echo "              ✦ MASTER TERMUX ✦"
echo
echo "  👑 OWNER    : $OWNER_NAME"
echo "  ✈ TELEGRAM : $TELEGRAM"
echo "  ● STATUS    : ONLINE"
echo "  ◈ SHELL     : ZSH"

printf '\033[0m'

printf '\033[%sm' "$COLOR_CODE"

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

printf '\033[0m'

echo
EOF

chmod 755 "$BASE/banner"

# ============================================================
# SYSTEM INFO
# ============================================================

cat > "$BASE/sysinfo" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

echo
echo "╔════════════════════════════════════════════════╗"
echo "║             SYSTEM INFORMATION                ║"
echo "╠════════════════════════════════════════════════╣"

printf "║ Date   : %-37s║\n" "$(date '+%Y-%m-%d')"
printf "║ Time   : %-37s║\n" "$(date '+%H:%M:%S')"
printf "║ User   : %-37s║\n" "$(whoami)"
printf "║ Shell  : %-37s║\n" "$SHELL"
printf "║ Host   : %-37s║\n" "$(hostname 2>/dev/null || echo Android)"

echo "╚════════════════════════════════════════════════╝"
echo
EOF

chmod 755 "$BASE/sysinfo"

# ============================================================
# MATRIX
# ============================================================

cat > "$BASE/matrix" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

cmatrix
EOF

chmod 755 "$BASE/matrix"

# ============================================================
# OWNER PANEL
# ============================================================

echo "🔐 Installing protected Owner Panel..."

cat > "$BASE/owner" <<'EOF'
#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/.jihad-termux"

CONFIG="$BASE/config"
HASH_FILE="$BASE/.owner_pin_hash"
COLOR_FILE="$BASE/.banner_color"

echo
echo "╔════════════════════════════════════════════════╗"
echo "║               🔐 OWNER LOGIN                 ║"
echo "╚════════════════════════════════════════════════╝"
echo

read -r -s -p "🔑 Owner PIN: " ENTERED_PIN

echo

INPUT_HASH=$(printf '%s' "$ENTERED_PIN" | sha256sum | awk '{print $1}')

unset ENTERED_PIN

STORED_HASH=$(cat "$HASH_FILE")

if [ "$INPUT_HASH" != "$STORED_HASH" ]; then

    unset INPUT_HASH
    unset STORED_HASH

    echo
    echo "❌ ACCESS DENIED"
    echo

    exit 1
fi

unset INPUT_HASH
unset STORED_HASH

echo
echo "✅ ACCESS GRANTED"
echo

while true; do

echo "╔════════════════════════════════════════════════╗"
echo "║           👑 OWNER CONTROL PANEL             ║"
echo "╠════════════════════════════════════════════════╣"
echo "║ [1] Change Banner Name                        ║"
echo "║ [2] Change Telegram                           ║"
echo "║ [3] Change Banner Color                       ║"
echo "║ [4] Preview Banner                            ║"
echo "║ [5] Reset Banner                              ║"
echo "║ [0] Exit                                      ║"
echo "╚════════════════════════════════════════════════╝"
echo

read -r -p "Select Option: " OPTION

case "$OPTION" in

1)

    read -r -p "Enter New Banner Name: " NEW_NAME

    if [ -n "$NEW_NAME" ]; then

        TMP="$CONFIG.tmp"

        awk -v n="$NEW_NAME" '
        BEGIN {
            gsub(/"/, "\\\"", n)
        }

        /^OWNER_NAME=/ {
            print "OWNER_NAME=\"" n "\""
            next
        }

        {print}
        ' "$CONFIG" > "$TMP"

        mv "$TMP" "$CONFIG"

        chmod 600 "$CONFIG"

        echo
        echo "✅ Banner Name Updated."

    fi

;;

2)

    read -r -p "Enter New Telegram: " NEW_TG

    if [ -n "$NEW_TG" ]; then

        TMP="$CONFIG.tmp"

        awk -v n="$NEW_TG" '
        BEGIN {
            gsub(/"/, "\\\"", n)
        }

        /^TELEGRAM=/ {
            print "TELEGRAM=\"" n "\""
            next
        }

        {print}
        ' "$CONFIG" > "$TMP"

        mv "$TMP" "$CONFIG"

        chmod 600 "$CONFIG"

        echo
        echo "✅ Telegram Updated."

    fi

;;

3)

    echo
    echo "╔════════════════════════════════════════════════╗"
    echo "║                 🎨 COLORS                    ║"
    echo "╠════════════════════════════════════════════════╣"
    echo "║ [1]  Green                                    ║"
    echo "║ [2]  Red                                      ║"
    echo "║ [3]  Blue                                     ║"
    echo "║ [4]  Yellow                                   ║"
    echo "║ [5]  Purple                                   ║"
    echo "║ [6]  Cyan                                     ║"
    echo "║ [7]  White                                    ║"
    echo "║ [8]  Orange                                   ║"
    echo "║ [9]  Pink                                     ║"
    echo "║ [10] Light Blue                               ║"
    echo "║ [0]  Cancel                                   ║"
    echo "╚════════════════════════════════════════════════╝"
    echo

    read -r -p "Choose Color: " COLOR

    case "$COLOR" in

    1)
        CODE="1;32"
        NAME="Green"
    ;;

    2)
        CODE="1;31"
        NAME="Red"
    ;;

    3)
        CODE="1;34"
        NAME="Blue"
    ;;

    4)
        CODE="1;33"
        NAME="Yellow"
    ;;

    5)
        CODE="1;35"
        NAME="Purple"
    ;;

    6)
        CODE="1;36"
        NAME="Cyan"
    ;;

    7)
        CODE="1;37"
        NAME="White"
    ;;

    8)
        CODE="38;5;208"
        NAME="Orange"
    ;;

    9)
        CODE="38;5;213"
        NAME="Pink"
    ;;

    10)
        CODE="38;5;117"
        NAME="Light Blue"
    ;;

    0)
        continue
    ;;

    *)
        echo "❌ Invalid color."
        continue
    ;;

    esac

    printf '%s\n' "$CODE" > "$COLOR_FILE"

    chmod 600 "$COLOR_FILE"

    echo
    echo "✅ Color changed to $NAME."

;;

4)

    "$BASE/banner"

;;

5)

    cat > "$CONFIG" <<EOF
OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"
EOF

    printf '1;32\n' > "$COLOR_FILE"

    chmod 600 "$CONFIG"
    chmod 600 "$COLOR_FILE"

    echo
    echo "✅ Banner reset successfully."

;;

0)

    echo "👋 Owner Panel Closed."
    exit 0

;;

*)

    echo "❌ Invalid option."

;;

esac

echo

done
EOF

chmod 700 "$BASE/owner"

# ============================================================
# INSTALL COMMANDS
# ============================================================

echo "⚙️ Installing commands..."

mkdir -p "$PREFIX/bin"

ln -sf "$BASE/banner" "$PREFIX/bin/banner"
ln -sf "$BASE/owner" "$PREFIX/bin/owner"
ln -sf "$BASE/sysinfo" "$PREFIX/bin/sysinfo"
ln -sf "$BASE/matrix" "$PREFIX/bin/matrix"

# ============================================================
# ZSH AUTO START
# ============================================================

touch "$HOME/.zshrc"

if ! grep -q "jihad-termux/banner" "$HOME/.zshrc" 2>/dev/null; then

cat >> "$HOME/.zshrc" <<'EOF'

# JIHAD BHAI MASTER TERMUX
if [ -t 1 ]; then
    "$HOME/.jihad-termux/banner"
fi
EOF

fi

# ============================================================
# FINISH
# ============================================================

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "             ✅ INSTALLATION COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "👑 OWNER     : JIHAD BHAI"
echo "✈ TELEGRAM  : @TEAM_XBD1M"
echo "🔐 PIN       : SHA-256 protected"
echo "🟢 DEFAULT   : GREEN"
echo "🎨 COLORS    : 10"
echo
echo "Commands:"
echo "  banner"
echo "  owner"
echo "  sysinfo"
echo "  matrix"
echo
echo "🚀 Starting..."
echo

sleep 1

"$BASE/banner"
