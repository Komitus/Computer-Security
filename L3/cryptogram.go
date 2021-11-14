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
		//fmt.Println(extractedByte)

		if toInt, err := strconv.ParseInt(extractedByte, 2, 0); err != nil {
			fmt.Println(err)
		} else {
			c.chars = append(c.chars, byte(toInt))
			//fmt.Printf("%d\n", toInt)
		}
	}
	return c
}

func (c Cryptogram) getChar(index int) byte {
	if index < len(c.chars) {
		return c.chars[index]
	} else {
		return '*'
	}
}
