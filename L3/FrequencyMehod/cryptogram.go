package main

import (
	"fmt"
	"strconv"
)

type Cryptogram struct {
	chars []byte
}

func NewCryptogram(splited []string) *Cryptogram {
	c := new(Cryptogram)

	for _, extractedByte := range splited {
		if toInt, err := strconv.ParseInt(extractedByte, 2, 0); err != nil {
			fmt.Println(err)
		} else {
			c.chars = append(c.chars, byte(toInt))
			//fmt.Printf("%c\n", toInt)
		}
	}
	/*
		fmt.Println(len(cipher))
		for i := 0; i < len(cipher); i += 8 {
			if toInt, err := strconv.ParseInt(string(cipher[i:i+8]), 2, 0); err != nil {
				fmt.Println(err)
			} else {
				if len(cipher) > i+8 {
					if cipher[i+8] == ' ' {
						i++
					}
				}

				c.chars = append(c.chars, byte(toInt))
				//fmt.Printf("%c\n", toInt)
			}
		}
	*/
	return c
}

func (c Cryptogram) getChar(index int) byte {
	if index < len(c.chars) {
		return c.chars[index]
	} else {
		return '*'
	}
}
