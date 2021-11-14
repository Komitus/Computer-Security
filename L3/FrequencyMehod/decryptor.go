package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strings"
)

type kv struct {
	Key   byte
	Value int
}

type Decryptor struct {
	cryptograms      []Cryptogram
	lettersFrequency map[byte]int
	longest          int
}

func NewDecryptor() *Decryptor {

	d := new(Decryptor)

	d.lettersFrequency = make(map[byte]int)
	d.lettersFrequency['i'] = 883
	d.lettersFrequency['e'] = 868
	d.lettersFrequency['a'] = 837
	d.lettersFrequency['o'] = 753
	d.lettersFrequency['n'] = 569
	d.lettersFrequency['z'] = 533
	d.lettersFrequency['r'] = 415
	d.lettersFrequency['s'] = 413
	d.lettersFrequency['w'] = 411
	d.lettersFrequency['y'] = 403
	d.lettersFrequency['c'] = 389
	d.lettersFrequency['t'] = 385
	d.lettersFrequency['d'] = 335
	d.lettersFrequency['k'] = 301
	d.lettersFrequency['p'] = 287
	d.lettersFrequency['m'] = 281
	d.lettersFrequency['j'] = 228
	d.lettersFrequency['l'] = 224
	d.lettersFrequency['u'] = 206
	d.lettersFrequency['b'] = 193
	d.lettersFrequency['g'] = 146
	d.lettersFrequency['h'] = 125
	d.lettersFrequency[' '] = 1000
	d.lettersFrequency[','] = 160
	d.lettersFrequency['.'] = 100
	d.lettersFrequency['-'] = 100
	d.lettersFrequency['"'] = 100
	d.lettersFrequency['!'] = 100
	d.lettersFrequency['?'] = 100
	d.lettersFrequency[':'] = 100
	d.lettersFrequency[';'] = 100
	d.lettersFrequency['('] = 100
	d.lettersFrequency[')'] = 100

	//Big letters
	for i := 65; i < 91; i++ {
		d.lettersFrequency[byte(i)] = 100
		//fmt.Println(string(byte(i)))
	}
	//Numbers
	for i := 48; i < 58; i++ {
		d.lettersFrequency[byte(i)] = 100

	}

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
	var key []byte

	for i := 0; i < d.longest; i++ {

		var possibleKey = make(map[byte]int)
		//cryptograms with length smaller than longest
		cryptIds := make([]int, len(d.cryptograms))

		for idx := 0; idx < len(d.cryptograms); idx++ {
			if i < len(d.cryptograms[idx].chars) {
				cryptIds = append(cryptIds, idx)
			}
		}

		for _, idx := range cryptIds {
			for possible, possibleVal := range d.lettersFrequency {

				xor_val := d.cryptograms[idx].getChar(i) ^ possible

				if _, ok := d.lettersFrequency[xor_val]; ok {
					possibleKey[xor_val] = possibleKey[xor_val] + possibleVal
				} else {
					possibleKey[xor_val] = possibleVal
				}
			}
		}
		//sort map by value
		var possibleSlice []kv
		for k, v := range possibleKey {
			possibleSlice = append(possibleSlice, kv{k, v})
		}

		sort.Slice(possibleSlice, func(i, j int) bool {
			//bigger at start bcs we want to the most possible
			return possibleSlice[i].Value > possibleSlice[j].Value
		})

		bestPossible := byte(' ')
		bestCounter := 0

		for _, possiblePair := range possibleSlice {
			counter := 0

			for _, idx := range cryptIds {

				//Check if XOR returns byte from alphabet
				xor_val := d.cryptograms[idx].getChar(i) ^ possiblePair.Key
				if _, ok := d.lettersFrequency[xor_val]; ok {
					counter += 1
				}
			}
			//Key that gives a sign from alphabet the most often is the best
			if counter > bestCounter {
				bestCounter = counter
				bestPossible = possiblePair.Key
			}

		}
		key = append(key, bestPossible)
		cryptIds = nil
		possibleSlice = nil
		possibleKey = nil
	}

	return key
}
func (d *Decryptor) decryptToFile(filename string) {
	key := d.findKey()

	f, _ := os.Create(filename)
	for k := 0; k < len(d.cryptograms); k++ {

		for i := 0; i < len(d.cryptograms[k].chars); i++ {
			f.WriteString(string(d.cryptograms[k].getChar(i) ^ key[i]))
		}
		f.WriteString("\n")
	}

	defer f.Close()
}
