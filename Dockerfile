ARG TARGETARCH
FROM quay.io/buildah/stable:latest AS base
RUN yum clean all && \
    yum makecache && \
    yum install -y unzip less groff mandoc git


FROM base AS branch-arm64
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"

FROM base AS branch-amd64
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

FROM branch-${TARGETARCH} AS final
RUN unzip awscliv2.zip
RUN ./aws/install
