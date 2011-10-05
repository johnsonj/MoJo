#!/bin/sh

bundle update
bundle exec rake db:migrate
bundle exec rake
