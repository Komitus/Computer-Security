package main

import (
	"crypto/tls"
	"fmt"
	"log"
	"net/http"
)

func main() {

	// generate a `Certificate` struct
	var cert tls.Certificate
	var s *http.Server
	var err error
	if cert, err = tls.LoadX509KeyPair("certA.crt", "keyA.unencrypted.pem"); err == nil {
		// create a custom server with `TLSConfig`
		s = &http.Server{
			Addr:    ":8080",
			Handler: nil, // use `http.DefaultServeMux`
			TLSConfig: &tls.Config{
				Certificates: []tls.Certificate{cert},
			},
		}
	} else {
		log.Fatal(err)
	}

	// handle `/` route
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		file := "html/" + r.URL.Path[1:] // by this you cannot acces other files than html
		http.ServeFile(w, r, file)
	})
	fmt.Printf("Starting server at port 443:8080\n")
	fmt.Printf("https://my.bezpieka.pl/\n")
	log.Fatal(s.ListenAndServeTLS("", ""))

}
