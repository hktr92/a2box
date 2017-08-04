####
## a2box - module to add a new virtual host
##
## this module generates a new virtual host
##
## @author Petru Szemereczki
## @version 1.0
## @TODO keep track of added vhosts and easily remove them
####

## Displays module informations
function a2box:add:info
{

}

## Generates a new vhost
function a2box:add:new
{
  local project_name=$1
  local project_type=$2
  local progress=

  if [[ -z "${project_name}" ]] && [[ -z "${1}" ]]; then
    read -p "Please write project's name: " project_name
  fi

  local document_root="${A2BOX_WORK_DIR}/${project_name}"


}
