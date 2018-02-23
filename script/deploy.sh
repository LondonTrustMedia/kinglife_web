#!/bin/bash

current_dir=$(cd "$(dirname $0)" && pwd)
deploy_dir=$current_dir/.deploy

([ -e $deploy_dir ] || (git clone git@github.com:LondonTrustMedia/kinglife_web.git $deploy_dir)) && cd $deploy_dir && git pull

rsync -vaz $deploy_dir/web/ kinglife@kinglife.rich:/home/kinglife/sites/kinglife.rich/

echo "Done!"

