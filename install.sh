#!/data/data/com.termux/files/usr/bin/bash

set -e

# ============================================================
#        JIHAD BHAI MASTER TERMUX
#        FINAL SECURE EDITION
# ============================================================

BASE="$HOME/.jihad-termux"
CONFIG="$BASE/config"
HASH_FILE="$BASE/.owner_pin_hash"
COLOR_FILE="$BASE/.banner_color"

OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"

# SHA-256 hash of Owner PIN: 25535
OWNER_PIN_HASH="c6c9686891996d754575c6330ec5049ee18eea3379652cc47908c3b9d768c837"

mkdir -p "$BASE"
chmod 700 "$BASE"

clear

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "              JIHAD BHAI MASTER TERMUX"
echo "                 SECURE INSTALLER"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

# ============================================================
# INSTALL REQUIRED PACKAGES
# ============================================================

echo "⚡ Installing required packages..."
echo

pkg update -y
pkg install -y coreutils git zsh curl ncurses-utils cmatrix

echo
echo "✅ Packages installed."

# ============================================================
# SECURE PIN HASH
# ============================================================

if [ ! -f "$HASH_FILE" ]; then

    printf '%s\n' "$OWNER_PIN_HASH" > "$HASH_FILE"

    chmod 600 "$HASH_FILE"

fi

# ============================================================
# DEFAULT CONFIG
# ============================================================

if [ ! -f "$CONFIG" ]; then

cat > "$CONFIG" <<EOF
OWNER_NAME="$OWNER_NAME"
TELEGRAM="$TELEGRAM"
EOF

fi

chmod 600 "$CONFIG"

# ============================================================
# DEFAULT GREEN COLOR
# ============================================================

if [ ! -f "$COLOR_FILE" ]; then
    echo "1;32" > "$COLOR_FILE"
fi

chmod 600 "$COLOR_FILE"

# ============================================================
# DYNAMIC THICK ASCII LETTER ENGINE
# ============================================================

cat > "$BASE/render_banner" <<'RENDER'

#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/.jihad-termux"

source "$BASE/config" 2>/dev/null || true

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

A[' ']='     
     
     
     
     '

NAME="${OWNER_NAME:-JIHAD BHAI}"

NAME=$(printf '%s' "$NAME" | tr '[:lower:]' '[:upper:]')

for ((ROW=0; ROW<5; ROW++))
do

    LINE=""

    for ((I=0; I<${#NAME}; I++))
    do

        CHAR="${NAME:I:1}"

        if [[ -v "A[$CHAR]" ]]
        then
            BLOCK="${A[$CHAR]}"
        else
            BLOCK=" "
        fi

        PART=$(printf '%s\n' "$BLOCK" | sed -n "$((ROW+1))p")

        LINE="${LINE}${PART}  "

    done

    printf '%s\n' "$LINE"

done

RENDER

chmod 700 "$BASE/render_banner"

# ============================================================
# BANNER COMMAND
# ============================================================

cat > "$BASE/banner" <<'BANNER'

#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/.jihad-termux"

source "$BASE/config"

COLOR_CODE="1;32"

if [ -f "$BASE/.banner_color" ]
then
    COLOR_CODE=$(cat "$BASE/.banner_color")
fi

clear

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

printf "\033[%sm" "$COLOR_CODE"

"$BASE/render_banner"

printf '\033[0m'

echo
echo "                 ✦ MASTER TERMUX ✦"
echo

printf '\033[1;37m'
echo "  👑 OWNER     : $OWNER_NAME"
echo "  ✈ TELEGRAM  : $TELEGRAM"
echo "  ● STATUS     : ONLINE"
echo "  ◈ SHELL      : ZSH"
printf '\033[0m'

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo

BANNER

chmod 755 "$BASE/banner"

# ============================================================
# SYSTEM INFORMATION
# ============================================================

cat > "$BASE/sysinfo" <<'SYSINFO'

#!/data/data/com.termux/files/usr/bin/bash

echo

echo "╔══════════════════════════════════════════════════╗"
echo "║              SYSTEM INFORMATION                 ║"
echo "╠══════════════════════════════════════════════════╣"

printf "║ Date       : %-35s║\n" "$(date '+%Y-%m-%d')"

printf "║ Time       : %-35s║\n" "$(date '+%H:%M:%S')"

printf "║ User       : %-35s║\n" "$(whoami)"

printf "║ Shell      : %-35s║\n" "$SHELL"

printf "║ Host       : %-35s║\n" "$(hostname 2>/dev/null || echo Android)"

echo "╚══════════════════════════════════════════════════╝"

echo

SYSINFO

chmod 755 "$BASE/sysinfo"

# ============================================================
# MATRIX
# ============================================================

cat > "$BASE/matrix" <<'MATRIX'

#!/data/data/com.termux/files/usr/bin/bash

cmatrix

MATRIX

chmod 755 "$BASE/matrix"

# ============================================================
# SECURE OWNER PANEL
# ============================================================

cat > "$BASE/owner" <<'OWNER'

#!/data/data/com.termux/files/usr/bin/bash

BASE="$HOME/.jihad-termux"

CONFIG="$BASE/config"

HASH_FILE="$BASE/.owner_pin_hash"

COLOR_FILE="$BASE/.banner_color"

echo

echo "╔══════════════════════════════════════════════════╗"
echo "║              🔐 OWNER LOGIN                     ║"
echo "╚══════════════════════════════════════════════════╝"

echo

read -r -s -p "🔑 Owner PIN: " ENTERED_PIN

echo

INPUT_HASH=$(printf '%s' "$ENTERED_PIN" | sha256sum | awk '{print $1}')

unset ENTERED_PIN

STORED_HASH=$(cat "$HASH_FILE")

if [ "$INPUT_HASH" != "$STORED_HASH" ]
then

    unset INPUT_HASH
    unset STORED_HASH

    echo
    echo "❌ ACCESS DENIED"
    echo "Wrong Owner PIN."
    echo

    exit 1

fi

unset INPUT_HASH
unset STORED_HASH

echo
echo "✅ ACCESS GRANTED"
echo

while true
do

echo "╔══════════════════════════════════════════════════╗"
echo "║              👑 OWNER CONTROL PANEL             ║"
echo "╠══════════════════════════════════════════════════╣"
echo "║ [1] Change Banner Name                          ║"
echo "║ [2] Change Telegram                             ║"
echo "║ [3] Change Banner Color                         ║"
echo "║ [4] Preview Banner                              ║"
echo "║ [5] Reset Banner                                ║"
echo "║ [0] Exit                                        ║"
echo "╚══════════════════════════════════════════════════╝"

echo

read -r -p "Select Option: " OPTION

case "$OPTION" in

1)

read -r -p "Enter New Banner Name: " NEW_NAME

if [ -n "$NEW_NAME" ]
then

    sed -i "s/^OWNER_NAME=.*/OWNER_NAME=\"$NEW_NAME\"/" "$CONFIG"

    chmod 600 "$CONFIG"

    echo
    echo "✅ Banner name changed."
    echo "🔥 Thick ASCII style will be generated automatically."

fi

;;

2)

read -r -p "Enter New Telegram: " NEW_TG

if [ -n "$NEW_TG" ]
then

    sed -i "s/^TELEGRAM=.*/TELEGRAM=\"$NEW_TG\"/" "$CONFIG"

    chmod 600 "$CONFIG"

    echo
    echo "✅ Telegram changed."

fi

;;

3)

echo
echo "╔══════════════════════════════════════════════════╗"
echo "║              🎨 BANNER COLORS                   ║"
echo "╠══════════════════════════════════════════════════╣"
echo "║ [1]  🟢 Green                                  ║"
echo "║ [2]  🔴 Red                                    ║"
echo "║ [3]  🔵 Blue                                   ║"
echo "║ [4]  🟡 Yellow                                 ║"
echo "║ [5]  🟣 Purple                                 ║"
echo "║ [6]  🔷 Cyan                                   ║"
echo "║ [7]  ⚪ White                                  ║"
echo "║ [8]  🟠 Orange                                 ║"
echo "║ [9]  🌸 Pink                                   ║"
echo "║ [10] 💙 Light Blue                             ║"
echo "║ [0]  Cancel                                    ║"
echo "╚══════════════════════════════════════════════════╝"

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
echo "✅ Banner color changed to: $NAME"

;;

4)

"$BASE/banner"

;;

5)

cat > "$CONFIG" <<EOF
OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"
EOF

echo "1;32" > "$COLOR_FILE"

chmod 600 "$CONFIG"
chmod 600 "$COLOR_FILE"

echo
echo "✅ Banner reset."
echo "🟢 Default Green color restored."

;;

0)

echo
echo "👋 Owner Panel Closed."
exit 0

;;

*)

echo
echo "❌ Invalid option."

;;

esac

echo

done

OWNER

chmod 700 "$BASE/owner"

# ============================================================
# TERMUX COMMAND LINKS
# ============================================================

mkdir -p "$PREFIX/bin"

ln -sf "$BASE/banner" "$PREFIX/bin/banner"

ln -sf "$BASE/owner" "$PREFIX/bin/owner"

ln -sf "$BASE/sysinfo" "$PREFIX/bin/sysinfo"

ln -sf "$BASE/matrix" "$PREFIX/bin/matrix"

# ============================================================
# ZSH CONFIGURATION
# ============================================================

touch "$HOME/.zshrc"

if ! grep -q "jihad-termux/banner" "$HOME/.zshrc" 2>/dev/null
then

cat >> "$HOME/.zshrc" <<'ZSH'

# ============================================================
# JIHAD BHAI MASTER TERMUX
# ============================================================

if [ -t 1 ]; then
    "$HOME/.jihad-termux/banner"
fi

ZSH

fi

# ============================================================
# FINISH
# ============================================================

echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "             ✅ INSTALLATION COMPLETE"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "👑 OWNER     : JIHAD BHAI"
echo "✈ TELEGRAM  : @TEAM_XBD1M"
echo "🔐 PIN       : Secure Hash Protected"
echo "🟢 COLOR     : Green"
echo
echo "Commands:"
echo
echo "  banner"
echo "  owner"
echo "  sysinfo"
echo "  matrix"
echo
echo "Restart Termux or run:"
echo
echo "  zsh"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
