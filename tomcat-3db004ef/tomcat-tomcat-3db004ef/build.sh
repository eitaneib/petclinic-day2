#!/bin/bash
if [[ -z "${PROJECT_ID}" ]]; then
  echo "ERROR: missing env variable PROJECT_ID"
  exit 1
fi
export VERSION="${VERSION:-latest}"

echo "building gcr.io/${PROJECT_ID}/tomcat-tomcat-3db004ef:${VERSION}"
gcloud builds submit --timeout 1h -t gcr.io/"${PROJECT_ID}"/tomcat-tomcat-3db004ef:"${VERSION}"
