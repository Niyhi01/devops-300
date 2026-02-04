#!/bin/bash

TARGET=${1:-google.com}
IP=$(dig +short $TARGET)

echo $IP
