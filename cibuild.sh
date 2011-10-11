#!/bin/sh

nice bundle update
nice bundle exec rake db:migrate
nice bundle exec rake spec
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "test failure"
  exit $RESULT
fi
if [ -n "${CC_BUILD_ARTIFACTS+x}" ]; then
  mv coverage ${CC_BUILD_ARTIFACTS}/
  git push heroku
  exit $?
fi
exit $RESULT