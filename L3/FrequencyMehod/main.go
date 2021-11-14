package main

func main() {

	d := NewDecryptor()
	d.readFile("input.txt")
	d.decryptToFile("output.txt")
}
