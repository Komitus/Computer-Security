package main

func main() {

	d := NewDecryptor()
	d.readFile("input.txt")
	//fmt.Println(d.findKey())
	d.decryptToFile("output.txt")
}
