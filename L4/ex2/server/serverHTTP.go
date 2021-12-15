package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		//fmt.Println(r.URL.Path)
		file := "html/" + r.URL.Path[1:] // by this you cannot acces other files than html
		http.ServeFile(w, r, file)
	})

	fmt.Printf("Starting server at port 8080\n")
	fmt.Printf("http://my.bezpieka.pl/\n")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
