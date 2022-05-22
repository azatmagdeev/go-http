FROM golang:1.18-bullseye AS build
WORKDIR /app
COPY . .
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o linux-server.bin ./cmd
RUN chmod +x ./linux-server.bin

FROM scratch
WORKDIR /app
COPY --from=build /app/linux-server.bin .
CMD ["/app/linux-server.bin"]




#name: CI
#
#on:
#  push:
#    branches:
#      - master
#      - main
#
#jobs:
#  build:
#    runs-on: ubuntu-20.04
#    steps:
#      - uses: actions/checkout@v3
#      - uses: actions/setup-go@v3
#        with:
#          go-version: '1.18' # The Go version to download (if necessary) and use.
#      - run: GOOS=linux GOARCH=amd64 go build -o linux-server.bin ./cmd
#      - run: GOOS=windows GOARCH=amd64 go build -o windows-server.exe ./cmd
#      - run: GOOS=darwin GOARCH=amd64 go build -o macos-server.bin ./cmd
#      - uses: actions/upload-artifact@v3
#        with:
#          name: binaries
#          path: |
#            ./linux-server.bin
#            ./windows-server.exe
#            ./macos-server.bin