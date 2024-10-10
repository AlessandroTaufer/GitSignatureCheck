FROM rockylinux/rockylinux:9

RUN dnf install -y git

COPY src /usr/bin
COPY resources /mnt/resources

# Tell git to ignore the doubious ownership of the files in the code, we expect that because it will be mounted by the container
RUN git config --global --add safe.directory /mnt/code

# Trust all the gps passed in the trusted_signatures folder
RUN mkdir -p /mnt/resources/live_trusted_signatures && trust-gpgs /mnt/resources/trusted_signatures

WORKDIR /mnt/code

ENTRYPOINT [ "verify-branch-signatures" ]