#!/bin/bash
NAMESPACE=$1
REPO=$2
COMMIT=$3

echo "adding ${NAMESPACE}/${REPO}..."
mkdir node_modules/@${NAMESPACE} # fails without consequence if it exists

if [ -z "$GIT_TOKEN" ]
then
  git clone --depth 1 --branch ${COMMIT} git@github.com:${NAMESPACE}/${REPO}.git ./node_modules/@${NAMESPACE}/${REPO}
else
  git clone --depth 1 --branch ${COMMIT} https://${GIT_TOKEN}:x-oauth-basic@github.com/${NAMESPACE}/${REPO}.git ./node_modules/@${NAMESPACE}/${REPO}
fi

echo "...added."

