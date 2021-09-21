package main

import (
	"log"
	"net/http"
)

func main() {
	mux := http.NewServeMux()

	mux.HandleFunc("/", homepageHandler)
	mux.HandleFunc("/hello", helloHandler)

	log.Println("Starting web on port 8080")

	err := http.ListenAndServe(":8080", mux)
	log.Fatal(err)
}

func homepageHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("This is home page"))
}

func helloHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Hello World!"))
}