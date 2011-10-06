#!/bin/sh

nice bundle update
nice bundle exec rake db:migrate
nice bundle exec rake spec
if [ -n "${CC_BUILD_ARTIFACTS+x}" ]; then
  mv coverage ${CC_BUILD_ARTIFACTS}/
fi
