package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

type Decryptor struct {
	cryptograms      []Cryptogram
	lettersFrequency map[byte]int
	longest          int
}

func NewDecryptor() *Decryptor {

	d := new(Decryptor)
	d.longest = 0
	return d
}

func (d *Decryptor) readFile(fileName string) {

	file, err := os.Open(fileName)
	if err != nil {
		fmt.Printf("error opening file: %v\n", err)
		os.Exit(1)
	}
	scanner := bufio.NewScanner(file)
	scanner.Split(bufio.ScanLines)

	for scanner.Scan() {
		splited := strings.Split(scanner.Text(), " ")
		if len(splited) > d.longest {
			d.longest = len(splited)
		}
		d.cryptograms = append(d.cryptograms, *NewCryptogram(splited))
	}
}

func (d *Decryptor) findKey() []byte {

	key := make([]byte, d.longest)
	for i := range key {
		key[i] = byte(0)
	}

	for i := 0; i < d.longest; i++ {

		//cryptograms with length smaller than longest
		cryptIds := make([]int, 0, len(d.cryptograms))

		for idx := 0; idx < len(d.cryptograms); idx++ {
			if i < len(d.cryptograms[idx].chars) {
				cryptIds = append(cryptIds, idx)
			}
		}

		for _, idx_1 := range cryptIds {

			prevCryptChars := &d.cryptograms[idx_1].chars
			spaceFailed := 0

			for _, idx_2 := range cryptIds {

				if idx_2 == idx_1 {
					continue
				}
				currCryptChars := &d.cryptograms[idx_2].chars

				xor_val := (*currCryptChars)[i] ^ (*prevCryptChars)[i]
				//xor space and ascii normal letters
				//!(xor_val > 64)
				if !(xor_val == 0 || (xor_val >= 65 && xor_val <= 90) || (xor_val >= 97 && xor_val <= 122)) {
					if spaceFailed == 4 {
						//fmt.Println("FAILED")
						break
					}
					spaceFailed++
				}
			}
			if spaceFailed < 4 {
				key[i] = (*prevCryptChars)[i] ^ byte(' ')
			}
		}
		cryptIds = nil

	}
	return key
}
func (d *Decryptor) decryptToFile(filename string) {
	key := d.findKey()

	f, _ := os.Create(filename)
	for k := 0; k < len(d.cryptograms); k++ {

		for i := 0; i < len(d.cryptograms[k].chars); i++ {
			f.WriteString(string(d.cryptograms[k].chars[i] ^ key[i]))
			//fmt.Println(d.cryptograms[k].chars[i] ^ key[i])
		}
		f.WriteString("\n")
	}

	defer f.Close()
}
