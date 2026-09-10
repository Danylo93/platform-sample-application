#!/usr/bin/env sh
set -eu

ENVIRONMENT="${1:?usage: deploy.sh <ti|hml|prod>}"
APP_NAME="${APP_NAME:-platform-sample-application}"
IMAGE="${CI_REGISTRY_IMAGE:-image-registry.openshift-image-registry.svc:5000/$APP_NAME/$APP_NAME}:${IMAGE_TAG:-latest}"
NAMESPACE="${APP_NAME}-${ENVIRONMENT}"

case "$ENVIRONMENT" in
  ti) REPLICAS=1 ;;
  hml) REPLICAS=1 ;;
  prod) REPLICAS=2 ;;
  *) echo "Invalid environment: $ENVIRONMENT"; exit 1 ;;
esac

echo "Deploying $APP_NAME:$IMAGE_TAG to $NAMESPACE"
oc project "$NAMESPACE"

export APP_NAME IMAGE REPLICAS ENVIRONMENT
for file in openshift/configmap.yaml openshift/deployment.yaml openshift/service.yaml openshift/route.yaml; do
  envsubst < "$file" | oc apply -f -
done

oc rollout status deployment/$APP_NAME --timeout=120s
oc get pods,svc,route
