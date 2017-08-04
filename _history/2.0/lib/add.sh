function a2box::add::info
{

}

function a2box::add::new
{
  # Command execution:
  # a2box new [project-name] [project-type]
  local project_name=$1
  local project_type=$2
  local progress=

  if [[ -z $project_name ]]; then
    read -p "Please write project's name: " project_name
  fi

  if [[ -z $project_type ]]; then
    read -p "Please write project's environment (${A2BOX_NEW_DEFAULT_ENV}): " project_type
  fi

  local document_root="/srv/apache2/${USER}/${project_type}.${project_name}.phx"

  abs::comment "/--------"
  abs::writeln "| Project administrator: ${USER}"
  abs::writeln "| Project hostname: ${project_name}"
  abs::writeln "| Project environment: ${project_type}"
  abs::writeln "| Document root: ${STYLE_COMMENT}${document_root}"
  abs::writeln "| Log directory: ${STYLE_COMMENT}${document_root}/var/logs/apache2"
  abs::writeln "\========="
  abs::writeln
  read -p "This is the configuration. Is this correct? [Y/n] " confirm

  case $confirm in
    Y|y) progress=true;;
    N|n) progress=false;;
    
  esac
}

function a2box::add::main
{

}
