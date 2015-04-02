package main

import (
	"github.com/codegangsta/cli"
	log "github.com/Sirupsen/logrus"
)

var Commands = []cli.Command{
	commandAdd,
	commandList,
	commandRemove,
}

var commandAdd = cli.Command{
	Name:  "add",
	Usage: "",
	Description: `
`,
	Action: doAdd,
}

var commandList = cli.Command{
	Name:  "list",
	Usage: "",
	Description: `
`,
	Action: doList,
}

var commandRemove = cli.Command{
	Name:  "remove",
	Usage: "",
	Description: `
`,
	Action: doRemove,
}

func assert(err error) {
	if err != nil {
		log.Fatal(err)
	}
}

func doAdd(c *cli.Context) {
	log.Info("add called")
}

func doList(c *cli.Context) {
}

func doRemove(c *cli.Context) {
}
