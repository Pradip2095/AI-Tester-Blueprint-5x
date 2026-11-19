#!/usr/bin/env bash

set -euo pipefail

usage() {
  printf 'Usage: %s <JIRA-KEY>\n' "$0" >&2
  printf 'Set JIRA_BASE_URL, JIRA_EMAIL, and JIRA_API_TOKEN before running.\n' >&2
}

if [[ $# -ne 1 ]]; then
  usage
  exit 2
fi

issue_key=$1
if [[ ! $issue_key =~ ^[A-Za-z][A-Za-z0-9_]*-[0-9]+$ ]]; then
  printf 'Invalid Jira issue key: %s\n' "$issue_key" >&2
  exit 2
fi

for variable in JIRA_BASE_URL JIRA_EMAIL JIRA_API_TOKEN; do
  if [[ -z ${!variable:-} ]]; then
    printf 'Required environment variable is not set: %s\n' "$variable" >&2
    exit 2
  fi
done

base_url=${JIRA_BASE_URL%/}
curl --fail-with-body --silent --show-error \
  --request GET \
  --user "$JIRA_EMAIL:$JIRA_API_TOKEN" \
  --header 'Accept: application/json' \
  "$base_url/rest/api/3/issue/$issue_key"
