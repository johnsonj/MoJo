#!/bin/sh

nice bundle update
nice bundle exec rake db:migrate
nice bundle exec rake
