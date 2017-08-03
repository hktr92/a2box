# Data replacement from configuration with real values
# Parameters:
#   $1 = key name
#   $2 = key value
#   $3 = filename (default: CONFIG)
#
# TODO: this function is legacy. please upgrade it
function replace
{
  local search=$1
  local replace=$2
  local buffer=$3

  if [[ ! -e "${buffer}" ]]; then
    echo -e "Template '${buffer}' does not exist."
    exit 1
  fi

  sed --expression "s/#${search}#/${replace}/g" --in-place "${buffer}"

  unset -v search
  unset -v replace
  unset -v buffer
}
