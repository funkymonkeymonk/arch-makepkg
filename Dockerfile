# BUILD-USING:    docker build -t buildingbananas/arch-pkgbuild .
# TEST-USING:     docker run --rm -i -t -h=arch-pkgbuild --name=arch-pkgbuild buildingbananas/arch-pkgbuild /bin/bash
# RUN-USING:      docker run --rm -h=arch-pkgbuild --name=arch-pkgbuild buildingbananas/arch-pkgbuild

FROM dock0/arch
MAINTAINER Will Weaver <monkey@buildingbananas.com>

RUN pacman -Syyu  --noconfirm
RUN pacman -S base-devel  --noconfirm


# Add package to be built
ADD . /build/
WORKDIR /build/

# Allow this file to be included into other Dockerfiles for testing
ONBUILD ADD . /build/

CMD ["makepkg", "--asroot"]
