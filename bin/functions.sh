# INFO: Przydatne funkcje

      NC='\033[0m'
   BLACK='\033[0;30m'
  D_GREY='\033[1;30m'
     RED='\033[0;31m'
   L_RED='\033[1;31m'
   GREEN='\033[0;32m'
 L_GREEN='\033[1;32m'
  ORANGE='\033[0;33m'
  YELLOW='\033[1;33m'
    BLUE='\033[0;34m'
  L_BLUE='\033[1;34m'
  PURPLE='\033[0;35m'
L_PURPLE='\033[1;35m'
    CYAN='\033[0;36m'
  L_CYAN='\033[1;36m'
  L_GRAY='\033[0;37m'
   WHITE='\033[1;37m'

function msg() {
    printf '%b\n' "$1" >&2
}

function msg_ok() {
    msg "${GREEN}[OK]${NC} ${1}${2}"
}

function msg_error() {
    msg "${RED}[ERROR]${NC} ${1}${2}"
}

function msg_warn () {
    msg "${YELLOW}[WARN]${NC} ${1}${2}"
}

function msg_info() {
    msg "${L_BLUE}[INFO]${NC} ${1}${2}"
}

# główny katalo repozytorium
function git_root_dir() {
    if [ "$1" == "vim" ]; then
        MSG=echo
    else
        MSG=msg_info
    fi
    GIT_ROOT=$(git rev-parse --show-toplevel)
    if [ ! "$?" -eq 0 ]; then
        $MSG "To nie jest repozytorium Git"
        exit
    fi
}

function check_git_dir() {
    if [ "$1" == "vim" ]; then
        MSG=echo
        git_root_dir vim
    else
        MSG=msg_info
        git_root_dir
    fi
    $MSG "DIR: $GIT_ROOT "
}

function check_git_url() {
    if [ "$1" == "vim" ]; then
        MSG=echo
        git_root_dir vim
    else
        MSG=msg_info
        git_root_dir
    fi
    grep url $GIT_ROOT/.git/config >/dev/null 2>&1
    if [ $? == 0 ]; then
        URL=$(grep url $GIT_ROOT/.git/config | cut -f 2 -d '=' | tr -d ' ')
        # msg_info "REPO: $URL "
        $MSG "REPO: $URL "
    fi
}

function check_git_user_name() {
    if [ "$1" == "vim" ]; then
        MSG_INFO=echo
        MSG_ERROR=echo
    else
        MSG_INFO=msg_info
        MSG_ERROR=msg_error
    fi
    git_root_dir
    grep name $GIT_ROOT/.git/config >/dev/null 2>&1
    if [ $? == 0 ]; then
        NAME=$(grep name $GIT_ROOT/.git/config | cut -f 2 -d '=' | tr -d ' ')
        $MSG_INFO "USER:  $NAME"
    else
        $MSG_ERROR "USER:  Brak informacji o koncie użytkownika."
    fi
}

function check_git_user_email() {
    if [ "$1" == "vim" ]; then
        MSG_INFO=echo
        MSG_ERROR=echo
    else
        MSG_INFO=msg_info
        MSG_ERROR=msg_error
    fi
    git_root_dir
    grep email $GIT_ROOT/.git/config >/dev/null 2>&1
    if [ $? == 0 ]; then
        EMAIL=$(grep email $GIT_ROOT/.git/config | cut -f 2 -d '=' | tr -d ' ')
        $MSG_INFO "EMAIL: $EMAIL"
    else
        $MSG_ERROR "EMAIL: Brak informacji o adresie e-mail użytkownika."
    fi
}

function check_git_sigkey() {
    if [ "$1" == "vim" ]; then
        MSG_INFO=echo
        MSG_ERROR=echo
    else
        MSG_INFO=msg_info
        MSG_ERROR=msg_error
    fi
    git_root_dir
    grep signingkey $GIT_ROOT/.git/config >/dev/null 2>&1
    if [ $? == 0 ]; then
        SIGNINGKEY=$(grep signingkey $GIT_ROOT/.git/config | cut -f 2 -d '=' | tr -d ' ')
        $MSG_INFO "SIGKEY: $SIGNINGKEY"
    else
        $MSG_ERROR "SIGKEY: Brak informacji o kluczu podpisu GPG."
    fi
}
