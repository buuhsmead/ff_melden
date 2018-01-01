#!/usr/bin/env bash

APP_NAME=ff-melden
TEAM_OR_MEMBER=huub



oc new-project ${APP_NAME}-${TEAM_OR_MEMBER}-dev

oc create -f pipeline.yml
