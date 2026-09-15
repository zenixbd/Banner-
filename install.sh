#!/data/data/com.termux/files/usr/bin/bash
set -e

BASE="$HOME/.jihad-termux"
CONFIG="$BASE/config"
HASH_FILE="$BASE/.owner_pin_hash"
DEFAULT_OWNER="JIHAD BHAI"
DEFAULT_TELEGRAM="@TEAM_XBD1M"
OWNER_PIN="25535"

mkdir -p "$BASE"
chmod 700 "$BASE"

# ---------- Dynamic thick ASCII banner renderer ----------
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

# Numbers / common symbols
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

for ((row=0; row<5; row++)); do
    line=""
    for ((i=0; i<${#NAME}; i++)); do
        ch="${NAME:i:1}"
        block="${A[$ch]}"
        if [ -z "$block" ]; then
            block=' '
        fi
        part=$(printf '%s\n' "$block" | sed -n "$((row+1))p")
        line+="${part:- }  "
    done
    printf '%s\n' "$line"
done
RENDER
chmod 700 "$BASE/render_banner"

# ---------- First install: create secure hash ----------
if [ ! -f "$HASH_FILE" ]; then
    printf '%s' "$OWNER_PIN" | sha256sum | awk '{print $1}' > "$HASH_FILE"
    chmod 600 "$HASH_FILE"
fi

cat > "$CONFIG" <<EOF
OWNER_NAME="$DEFAULT_OWNER"
TELEGRAM="$DEFAULT_TELEGRAM"
EOF
chmod 600 "$CONFIG"

# ---------- Banner command ----------
cat > "$BASE/banner" <<'BANNER'
#!/data/data/com.termux/files/usr/bin/bash
BASE="$HOME/.jihad-termux"
source "$BASE/config"

clear
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
"$BASE/render_banner"
echo
echo "                 ✦ MASTER TERMUX ✦"
echo
echo "  👑 OWNER     : $OWNER_NAME"
echo "  ✈ TELEGRAM  : $TELEGRAM"
echo "  ● STATUS     : ONLINE"
echo "  ◈ SHELL      : ZSH"
echo
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
BANNER
chmod 755 "$BASE/banner"

# ---------- System info ----------
cat > "$BASE/sysinfo" <<'SYS'
#!/data/data/com.termux/files/usr/bin/bash
echo
echo "╔════════════════════════════════════════════╗"
echo "║             SYSTEM INFORMATION             ║"
echo "╠════════════════════════════════════════════╣"
printf "║ Date     : %-31s║\n" "$(date '+%Y-%m-%d')"
printf "║ Time     : %-31s║\n" "$(date '+%H:%M:%S')"
printf "║ User     : %-31s║\n" "$(whoami)"
printf "║ Shell    : %-31s║\n" "$SHELL"
echo "╚════════════════════════════════════════════╝"
echo
SYS
chmod 755 "$BASE/sysinfo"

cat > "$BASE/matrix" <<'MATRIX'
#!/data/data/com.termux/files/usr/bin/bash
cmatrix
MATRIX
chmod 755 "$BASE/matrix"

# ---------- Secure owner panel ----------
cat > "$BASE/owner" <<'OWNER'
#!/data/data/com.termux/files/usr/bin/bash
BASE="$HOME/.jihad-termux"
CONFIG="$BASE/config"
HASH_FILE="$BASE/.owner_pin_hash"

chmod 600 "$CONFIG" "$HASH_FILE" 2>/dev/null || true

echo
echo "╔════════════════════════════════════════════╗"
echo "║          🔐 OWNER AUTHENTICATION           ║"
echo "╚════════════════════════════════════════════╝"
echo

read -r -s -p "🔑 Owner PIN: " PIN
echo

INPUT_HASH=$(printf '%s' "$PIN" | sha256sum | awk '{print $1}')
unset PIN
STORED_HASH=$(cat "$HASH_FILE")

if [ "$INPUT_HASH" != "$STORED_HASH" ]; then
    unset INPUT_HASH STORED_HASH
    echo "❌ Access Denied"
    exit 1
fi

unset INPUT_HASH STORED_HASH
echo "✅ Access Granted"
echo

while true; do
    echo "╔════════════════════════════════════════════╗"
    echo "║             👑 OWNER PANEL                 ║"
    echo "╠════════════════════════════════════════════╣"
    echo "║ [1] Change Banner Name                    ║"
    echo "║ [2] Change Telegram                       ║"
    echo "║ [3] Preview Banner                        ║"
    echo "║ [4] Reset Owner Banner                    ║"
    echo "║ [0] Exit                                  ║"
    echo "╚════════════════════════════════════════════╝"
    echo
    read -r -p "Select: " OPT

    case "$OPT" in
        1)
            read -r -p "New name: " NEW_NAME
            if [ -n "$NEW_NAME" ]; then
                # Safe replacement for the simple config format
                awk -v n="$NEW_NAME" 'BEGIN{gsub(/"/,"\\\"",n)}
                    /^OWNER_NAME=/ {print "OWNER_NAME=\"" n "\""; next}
                    {print}' "$CONFIG" > "$CONFIG.tmp"
                mv "$CONFIG.tmp" "$CONFIG"
                chmod 600 "$CONFIG"
                echo "✅ Name changed. It will automatically render in thick ASCII."
            fi
            ;;
        2)
            read -r -p "New Telegram: " NEW_TG
            if [ -n "$NEW_TG" ]; then
                awk -v n="$NEW_TG" 'BEGIN{gsub(/"/,"\\\"",n)}
                    /^TELEGRAM=/ {print "TELEGRAM=\"" n "\""; next}
                    {print}' "$CONFIG" > "$CONFIG.tmp"
                mv "$CONFIG.tmp" "$CONFIG"
                chmod 600 "$CONFIG"
                echo "✅ Telegram changed."
            fi
            ;;
        3)
            "$BASE/banner"
            ;;
        4)
            cat > "$CONFIG" <<EOF
OWNER_NAME="JIHAD BHAI"
TELEGRAM="@TEAM_XBD1M"
EOF
            chmod 600 "$CONFIG"
            echo "✅ Owner banner reset."
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

# ---------- Commands ----------
mkdir -p "$PREFIX/bin"
ln -sf "$BASE/banner" "$PREFIX/bin/banner"
ln -sf "$BASE/owner" "$PREFIX/bin/owner"
ln -sf "$BASE/sysinfo" "$PREFIX/bin/sysinfo"
ln -sf "$BASE/matrix" "$PREFIX/bin/matrix"

# ---------- ZSH ----------
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
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "             ✅ SECURE INSTALL COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
echo "Commands:"
echo "  banner   → Thick dynamic banner"
echo "  owner    → Protected Owner Panel"
echo "  sysinfo  → System information"
echo "  matrix   → Matrix effect"
echo
echo "Owner PIN: configured securely as a hash."
echo "Restart Termux or run: zsh"
echo
