ARG STEP_1_IMAGE=alpine:3.12

FROM ${STEP_1_IMAGE} AS STEP_1

# Go Kernel
ENV GOLANG_VERSION 1.14.7
ENV goRelArch 'linux-amd64'
ENV goRelSha256 '4a7fa60f323ee1416a4b1425aefc37ea359e9d64df19c326a58953a97ad41ea5'
ENV url "https://golang.org/dl/go${GOLANG_VERSION}.${goRelArch}.tar.gz"
ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
RUN wget -O go.tgz "$url" && \
	echo "${goRelSha256} *go.tgz" | sha256sum -c - && \
	tar -C /usr/local -xzf go.tgz && \
	rm go.tgz && \
	mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"

WORKDIR /root
