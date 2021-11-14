package main

import (
	"os"
)

func main() {
	args := os.Args
	var d *Decryptor
	if len(args) < 2 {
		d = NewDecryptor("")
	} else {
		d = NewDecryptor(args[1])
		d.readFile("input.txt")
		d.decryptToFile("output.txt")
	}

}
