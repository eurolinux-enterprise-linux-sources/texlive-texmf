#!/usr/bin/env ruby

$: << File.dirname(File.expand_path($0))

require 'base/kpseremote'

KpseRemote::start_server
