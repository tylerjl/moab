package main

import (
	"os"
	"github.com/codegangsta/cli"
	log "github.com/Sirupsen/logrus"
)

func main() {
	app := cli.NewApp()
	app.Name = "moab"
	app.Version = Version
	app.Usage = "automated management of a private AUR repository"
	app.Author = "Tyler Langlois"
	app.Email = "tjl@byu.net"
	app.Commands = Commands
	app.Flags = Flags
	app.Before = func(c *cli.Context) error {
		if c.Bool("json") {
			log.SetFormatter(&log.JSONFormatter{})
		}
		return nil
	}

	app.Run(os.Args)
}
