# coding: utf-8

@path = '/var/www/html'

worker_processes 1
working_directory @path

timeout 300
listen 8080
pid    "/var/run/unicorn.pid"

stderr_path "/var/log/ruby/unicorn.stderr.log"
stdout_path "/var/log/ruby/unicorn.stdout.log"
preload_app true
