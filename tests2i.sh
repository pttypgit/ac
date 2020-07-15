#create the ace s2i builder image
set -x
docker build -t acebuilder .
#build a ACE image for the app and libs using the git repo
#s2i build file:///path-to-sample-app _<BUILDER_IMAGE_NAME>_ _<OUTPUT_APPLICATION_IMAGE_NAME>_

s2i build https://github.com/pttypgit/ac acebuilder acebaked --env MAIN=simpleGET --env LICENSE=accept
#Run the ACE image, user random user in root group like openshift
#docker run -it -p 7800:7800 -u 1981:0 acecom
docker run -it -p 7800:7800 acebaked
