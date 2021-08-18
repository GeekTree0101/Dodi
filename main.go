package main

import (
	scaffold "github.com/Geektree0101/clean-swift-scaffold"
	"github.com/spf13/cobra"
)

var (
	rootCmd = &cobra.Command{
		Use:   "dodi",
		Short: "dodi cmd tools",
	}
)

func main() {
	rootCmd.AddCommand(scaffold.NewRunnerCommand("scaffold"))
	rootCmd.Execute()
}
