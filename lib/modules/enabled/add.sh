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
  abs::writeln "a2box - add module"
  abs::writeln ""
  abs::writeln "generates a new virtual host"
}

function a2box:add:_create_directory_skeleton
{
  local hostname=$1

  for directory in ${A2BOX_SKELETON[@]}; do
    mkdir -p "${A2BOX_WORK_DIR}/${hostname}/${directory}"
    if [[ $? -ne 0 ]]; then
      abs::error "unable to create directory: ${STYLE_COMMENT}${directory}"
      return $?
    fi

    abs::success "directory created: ${STYLE_SUCCESS}${directory}"
  done

  return 0
}

function a2box:add:_render_index_html
{
  local vhost_directory=$1
  a2box::render_template "${A2BOX_ROOT_DIR}/tpl/index.ctf" > "${vhost_directory}/public_html/index.html"
}

## Generates a new vhost
function a2box:add:new
{
  local project_name=$1
  local project_type=$2
  local progress=
  local username=

  if [[ ! -z "${SUDO_USER}" ]] && [[ "${USER}" == "root" ]]; then
    username="${SUDO_USER}"
  else
    username="${USER}"
  fi

  if [[ -z "${project_name}" ]] && [[ -z "${1}" ]]; then
    read -p "Please write project's name: " project_name
  fi

  local document_root="${A2BOX_WORK_DIR}/${project_name}"


}

function a2box:add:main
{
  a2box:add:new $@
  return $?
}
