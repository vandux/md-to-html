#!/usr/bin/env

ruby ./bin/build.rb
fswatch -o ./src | xargs -n1 -I{} ruby bin/build.rb & . ./bin/server.sh && fg
