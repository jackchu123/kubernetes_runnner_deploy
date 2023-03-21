#!/bin/bash
#

#read config file
source check.conf

#directory name
cp -rf fate-lab $namespace

#token change
token_id=`echo $token | base64 -w0`
sed -i "s/b0xwdWlGWGJQdFdxUTdDYzdRN0QK/$token_id/g" ./$namespace/secret.yaml

#image change
sed -i "s#golang:1.11.2#$image#g" ./$namespace/configmap.yaml

#namespace change
sed -i "s/innovation-lab/$namespace/g" `grep innovation-lab -rl --include="*.yaml" ./$namespace/`

#runner name change
sed -i "s/fatechain/$runner_name/g" `grep fatechain -rl --include="*.yaml" ./$namespace/`

#runner tag change
sed -i "s/RUNNERTAG/$tag_name/g" `grep fatechain -rl --include="*.yaml" ./$namespace/`
