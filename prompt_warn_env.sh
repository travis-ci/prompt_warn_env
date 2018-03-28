# should work in both bash and zsh?
function prompt_warn_env() {
  local names=($PROMPT_WARN_ENV_VARS)
  local vars=()
  local msg

  if [[ -z $names ]]; then
    names=(DATABASE_URL REDIS_URL)
  fi
  eval "names=(${names[@]})"

  for name in ${names[@]}; do
    if [[ -n $(eval echo "\$$name") ]]; then
      vars+=$name
    fi
  done

  if [[ -n $vars ]]; then
    msg=$(printf ", %s" "${vars[@]}")
    echo " ${msg:2}"
  fi
}
