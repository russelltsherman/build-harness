#!/usr/bin/env bash
# shellcheck disable=SC2034

# Colors
ESC_SEQ="\x1b["
C_BLUE="${ESC_SEQ}34;01m"
C_CYAN="${ESC_SEQ}36;01m"
C_GREEN="${ESC_SEQ}32;01m"
C_MAGENTA="${ESC_SEQ}35;01m"
C_RED="${ESC_SEQ}31;01m"
C_RESET="${ESC_SEQ}39;49;00m"
C_YELLOW="${ESC_SEQ}33;01m"

################################################################################
# TUI Functions
################################################################################

banner() {
  if [ -n "${PS1:-}" ]; then
    TERM=linux clear
  fi
  (>&2 echo -e "${C_GREEN}${BANNER}${C_RESET}")
}

action() {
  local -r msg="${1:-}"
  (>&2 echo -e "\n${C_YELLOW}[action]:${C_RESET}\n ⇒ ${msg} ...")
}

bot() {
  local -r msg="${1:-}"
  (>&2 echo -e "\n${C_GREEN}\[._.]/${C_RESET} - ${msg}")
}

bot_confirm() {
  local -r msg="${1:-}"
  (>&2 echo -e "\n${C_GREEN}\[._.]/${C_RESET} - ${msg}")
  info "Press any key to continue."
  # shellcheck disable=SC2162
  read
}

die() {
  local -r msg="${1:-}"
  local -r errnum="${2:-1}"
  (>&2 error "$@")
  exit "$errnum"
}

error() {
  local -r msg="${1:-}"
  (>&2 echo -e "\a${C_RED}[error]${C_RESET} ${msg}")
}

info() {
  local -r msg="${1:-}"
  (>&2 echo -e "${C_GREEN}[info]${C_RESET} ${msg}")
}

line() {
  (>&2 echo -e "------------------------------------------------------------------------------------")
}

ok() {
  local -r msg="${1:-}"
  (>&2 echo -e "${C_GREEN}[ok]${C_RESET} ${msg}")
}

running() {
  local -r msg="${1:-}"
  (>&2 echo -en "${C_YELLOW} ⇒ ${C_RESET} ${msg}:")
}

warn() {
  local -r msg="${1:-}"
  (>&2 echo -e "${C_YELLOW}[warning]${C_RESET} ${msg}")
}

wait_user_confirm() {
  read -n1 -rsp $'Press Y continue or Ctrl+C to exit...\n' key
  if [ "$key" = 'Y' ]; then
    echo '' # Y pressed, continue
  else
    wait_user_confirm # Anything else pressed, repeat prompt
  fi
}
