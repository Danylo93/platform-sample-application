#!/usr/bin/env sh
set -eu

APP_NAME="${APP_NAME:-platform-sample-application}"

for env in ti hml prod; do
  project="${APP_NAME}-${env}"
  if oc get project "$project" >/dev/null 2>&1; then
    echo "$project already exists"
  else
    oc new-project "$project"
  fi
done

oc projects
