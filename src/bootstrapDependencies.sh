#!/bin/bash
NAMESPACE=$1
REPO=$2
COMMIT=$3

echo "adding ${NAMESPACE}/${REPO}..."

# add the private repo root directory if it does not exist
[ ! -d "node_modules/@${NAMESPACE}" ] && mkdir node_modules/@${NAMESPACE}

if [ ! -d "node_modules/@${NAMESPACE}/${REPO}" ]
then
  if [ -z "$GIT_TOKEN" ]
  then
    git clone --depth 1 --branch ${COMMIT} git@github.com:${NAMESPACE}/${REPO}.git ./node_modules/@${NAMESPACE}/${REPO}
  else
    git clone --depth 1 --branch ${COMMIT} https://${GIT_TOKEN}:x-oauth-basic@github.com/${NAMESPACE}/${REPO}.git ./node_modules/@${NAMESPACE}/${REPO}
  fi

  echo "...added."
else
  echo "@${NAMESPACE}/${REPO} already exists. doing nothing"
fi


