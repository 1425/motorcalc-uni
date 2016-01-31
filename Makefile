build:
	go-bindata -o motors.go data
	go build

debug:
	go-bindata -o motors.go --debug data

release:
	GOOS=darwin GOARCH=amd64 go build -o dist/mcalc-osx
	GOOS=linux GOARCH=amd64 go build -o dist/mcalc-64
	GOOS=linux GOARCH=386 go build -o dist/mcalc-32
	GOOS=windows GOARCH=386 go build -o dist/mcalc-32.exe
	GOOS=windows GOARCH=amd64 go build -o dist/mcalc-64.exe
	zip -r dist.zip dist

.PHONY: clean
clean:
	rm -f dist/*
