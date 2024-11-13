#!/bin/tclsh

source ./.tcl/deps.tcl

package require act::http

namespace eval web {
	variable target
}

proc web::handle {} {
	variable target
	switch $target {
		/ {list 200 "hello, world!" "text/plain" }
		default {list 404 "not found" "text/plain"}
	}
}

act::http configure \
	-host 127.0.0.1 \
	-port 5151 \
	-get web::handle \
	-reqtargetvar web::target

puts "running web app on port 5151"

act::http run