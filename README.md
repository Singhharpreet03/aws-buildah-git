# aws-buildah-git

#docker build command:

buildah build --build-arg TARGETARCH=$(uname -m) -t aws-build-git .

Replace $(uname -m) with amd64 or arm64 manually if needed.
