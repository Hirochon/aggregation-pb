build: Dockerfile
	docker build . -t aggregation-pb:latest

hello-gen:
	protoc --go_out=. --go_opt=paths=source_relative \
		--go-grpc_out=. --go-grpc_opt=paths=source_relative \
		hello/proto/hello.proto

run:
	docker run --rm -it -v $PWD:/go/src/work aggregation-pb:latest make hello-gen
