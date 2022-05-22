package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
		body := []byte("GO ok!") //string
		writer.WriteHeader(200)
		writer.Write(body)

	})
	err := http.ListenAndServe("0.0.0.0:9999", nil)
	if err != nil {
		log.Fatal(err)
	}
}
