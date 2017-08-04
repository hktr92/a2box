####
## Renders a .ctf (Config Template File) template
##
## @parameter template the template's name
## @TODO make it better (like: take template from X and dump to Y?) or get rid of eval...
function a2box::render_template
{
  local template=$1
  eval "echo \"$(cat ${template})\""
}
