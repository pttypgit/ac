# acebuilder
#FROM openshift/base-centos7
FROM ibmcom/ace

# TODO: Put the maintainer name in the image metadata
# LABEL maintainer="author@me.com"

# TODO: Rename the builder environment variable to inform users about application you provide them
# ENV BUILDER_VERSION 1.0

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="Platform for building ACE" \
      io.k8s.display-name="builder ACE" \
      io.openshift.expose-services="7800:http,7600:http,7843:http,9843:http" \
      io.openshift.tags="builder,ace" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# TODO: Install required packages here:
# RUN yum install -y ... && yum clean all -y
# RUN yum install -y rubygems && yum clean all -y
# RUN gem install asdf

# TODO (optional): Copy the builder files into /opt/app-root
# COPY ./<builder_folder>/ /opt/app-root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image
# sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root
# This default user is created in the openshift/base-centos7 image
USER 1000


# TODO: Set the default port for applications built using this image
# EXPOSE 8080
EXPOSE 7800
EXPOSE 7600
EXPOSE 7843
EXPOSE 9483

# TODO: Set the default CMD for the image
# CMD ["/usr/libexec/s2i/usage"]

ENTRYPOINT [""]
CMD "/usr/libexec/s2i/usage"
