####
## Awesome Bash Stylizer
##
## This library is a helper for shell pretty output
## and it's based on ASCII colors
##
## @author Petru Szemereczki
## @version 1.4
####

## Outputs a line to the stdout
##
## @parameter output the message that is outputted to stdout
## @parameter style the user-defined ${STYLE_XXX} variable to the output.
##              defaults to ${STYLE_DEFAULT}
## @parameter logfile full path where stderr is dumped
function abs::writeln
{
  local output="$1"
  local style="${2:-${STYLE_DEFAULT}}"
  local logfile=${3:-"${ABS_LOG_FILE}"}

  if [[ ! -d $(dirname $logfile) ]]; then
    mkdir -p $(dirname $logfile)
  fi

  printf "${STYLE_COMMENT}[%s]${STYLE_DEFAULT} ${style}%s${STYLE_DEFAULT}" $(date +%H:%M:%S) "${output}" | tee --append "${logfile}"
}

## Dumps to stdout an error message (styling only)
##
## @parameter output the message to be outputted in stdout
## @TODO make something better than this (e.g. dump to stderr.log or smth)
function abs::error
{
  local output=$1

  abs::writeln "${output}" "${STYLE_ERROR}"
}

## Displays a success message to stdout
##
## @parameter output the message to be outputted in stdout
function abs::success
{
  local output=$1

  abs::writeln "${output}" "${STYLE_SUCCESS}"
}

## Displays a notice message to stdout
##
## @parameter output the message to be outputted in stdout
function abs::notice
{
  local output=$1

  abs::writeln "${output}" "${STYLE_NOTICE}"
}

## Displays a comment message to stdout (default: yellow foreground)
##
## @parameter output the message to be outputted in stdout
function abs::comment
{
  local output=$1

  abs::writeln "${output}" "${STYLE_COMMENT}"
}

## Displays command usage
##
## @parameter cmd_name the command's name
## @parameter cmd_info the command's short info
function abs::info
{
  local cmd_name=$1
  local cmd_info=$2

  printf "${STYLE_COMMENT}\t%s${STYLE_DEFAULT}\t\t%b\n" "${cmd_name}" "${cmd_info}"
}

## Extends abs::notice function to display command usage
##
## @parameter util the utility's name
## @parameter command the command's name
function abs::usage
{
  local program=$1
  local command=$2

  abs::notice "Usage: ${program} ${command} ${STYLE_COMMENT}[command]"
}

## Displays a line with execution status at the beginning
##
## @parameter status_type the status' type
##                        it can be only "ok" or "fail"
## @parameter status_msg the message to be displayed with status
function abs::status
{
  local status_type=$1
  local status_msg=$2

  if [[ "${status_type}" == "ok" ]]; then
    local out_message=" OK "
    local out_style="${STYLE_SUCCESS}"
  elif [[ "${status_type}" == "fail" ]]; then
    local out_message="FAIL"
    local out_style="${STYLE_ERROR}"
  fi

  printf "\t[${out_style}%s${STYLE_DEFAULT}]\t\t%b\n" "${out_message}" "${status_msg}"
}

## Displays the name of module's developer
##
## @parameter author author's name to be displayed in stdout
function abs::developer
{
  local author=$1
  abs::success "Written by ${STYLE_COMMENT}${author}${STYLE_DEFAULT}"
}
