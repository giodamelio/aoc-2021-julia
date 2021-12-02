# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.203.0/containers/alpine/.devcontainer/base.Dockerfile

# [Choice] Alpine version: 3.14, 3.13, 3.12, 3.11
ARG VARIANT="3.14"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-alpine-${VARIANT}

# Install Julia
ARG JULIA_MAJOR_MINOR="1.7"
ARG JULIA_PATCH=".0"
RUN wget https://julialang-s3.julialang.org/bin/musl/x64/${JULIA_MAJOR_MINOR}/julia-${JULIA_MAJOR_MINOR}${JULIA_PATCH}-musl-x86_64.tar.gz \
  && tar xzfv julia-${JULIA_MAJOR_MINOR}${JULIA_PATCH}-musl-x86_64.tar.gz \
  && rm julia-${JULIA_MAJOR_MINOR}${JULIA_PATCH}/LICENSE.md \
  && sudo cp -r julia-1.7.0/* /usr/