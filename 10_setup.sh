#!/usr/bin/env bash

APP_NAME=ff-melden


oc new-project ${APP_NAME}-dev

oc create -f pipeline.yml
