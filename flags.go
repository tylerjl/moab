package main

import (
	"github.com/codegangsta/cli"
)

var Flags = []cli.Flag{
	flagJson,
}

var flagJson = cli.BoolFlag{
	Name:  "json, j",
	Usage: "format logs in json",
}
