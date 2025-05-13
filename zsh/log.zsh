typeset -g -A colors

colors=(
  black 0
  red 1
  green 2
  yellow 3
  blue 4
  magenda 5
  cyan 6
  white 7
)

log() {
  key=${2:-white}
  printf "\033[3%dm%s\033[m\n" "$colors[$key]" "$1"
}
