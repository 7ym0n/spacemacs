#!/bin/sh

#
# Logging functions
#
case $LOGLEVEL in
    error )
        MACHINE_LOG_LEVEL=1
        ;;
    warning )
        MACHINE_LOG_LEVEL=2
        ;;
    ok )
        MACHINE_LOG_LEVEL=3
        ;;
    info )
        MACHINE_LOG_LEVEL=4
        ;;
    debug )
        MACHINE_LOG_LEVEL=5
        ;;
    *)
        MACHINE_LOG_LEVEL=4 ## Default loglevel value to info
esac

_logger() {
    COLOR=$1
    shift
    test -z "$SCRIPT_NAME" && SCRIPT_NAME=$(basename $0)
    builtin echo "$*" | /usr/bin/logger -t "[Emacs] $SCRIPT_NAME" -p "user.info"
    SCRIPT_NAME_FIXEDLEN=$(printf "%-25.25s" "$SCRIPT_NAME")
    cecho $COLOR "$SCRIPT_NAME_FIXEDLEN $*"
}

cecho () {
    COLOR=$1
    shift
    builtin echo -e "${COLOR}$*${NC}"
}

crit () {
    if [ $MACHINE_LOG_LEVEL -ge 1 ]; then _logger $BRED "[ KO ] $*"; fi
    # This variable incrementation is used to measure failure or success in tests
    CRITICAL_ERRORS_NUMBER=$((CRITICAL_ERRORS_NUMBER+1))
}

no_entity() {
    if [ $MACHINE_LOG_LEVEL -ge 1 ]; then _logger $BGREEN "[ none entity, so it's not scored ] $*"; fi
    # This variable incrementation is used to measure whether the service exists in tests
    NONEXISTENT_NUMBER=$((NONEXISTENT_NUMBER+1))
}

warn () {
    if [ $MACHINE_LOG_LEVEL -ge 2 ]; then _logger $BYELLOW "[WARN] $*"; fi
}

ok () {
    if [ $MACHINE_LOG_LEVEL -ge 3 ]; then _logger $BGREEN "[ OK ] $*"; fi
}

info () {
    if [ $MACHINE_LOG_LEVEL -ge 4 ]; then _logger ''      "[INFO] $*"; fi
}

debug () {
    if [ $MACHINE_LOG_LEVEL -ge 5 ]; then _logger $GRAY "[DBG ] $*"; fi
}

check_os() {
    typeset -l OSINFO
    if type -p lsb_release >/dev/null; then
        lsb_release -sir | xargs echo
    elif type -p sw_vers >/dev/null; then
        OSINFO="OS X $(sw_vers -productVersion)"
    elif [ -r /etc/os-release ]; then
        source /etc/os-release
        OSINFO="$NAME $VERSION_ID"
    else
        local os="$(cat /etc/{centos,redhat,fedora,system}-release /etc/debian_version 2>/dev/null | head -1)"
        OSINFO="${os:-$(uname -sr)}"
    fi
    echo $OSINFO
}

is_os() {
    typeset -l OS
    OS=$1
    IS=`grep -Ei $OS <<< $(os_info)`
    if [ ! -z "$IS" ];then
        return 0
    fi

    return 1
}

install_pyenv_tools(){
    info "installing python develop env."
    pip install "ptvsd>=4.2"
    pip install --upgrade "jedi>=0.13.0" "json-rpc>=1.8.1" "service_factory>=0.1.5"
    pip install pyls-isort
    pip install flake8
    pip install autoflake
    pip install importmagic epc
    info "installed python develop env."
}

install_npmenv_tools() {
    info "installing javascript web develop tools."
    npm install -g js-beautify
    npm install -g import-js
    npm install -g eslin
    info "installed javascript web develop tools."
}

install_goenv() {
    info "install golang develop env"
}

install_ccenv() {
    info "install c-c++ develop env"
}

# install base software
install_base_pkg() {
    info "installing base software."
    if is_os "ubuntu|debian";then
        apt-get install aspell silversearcher-ag gcc g++ gcc-dev g++-dev \
                clang clang-dev cmake automake autoconf libc-dev libxml2 \
                libxml2-dev python3 python3-dev golang
        info "installed base software."
    else
        crit "not install base software"
    fi

}


