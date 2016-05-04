FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y wget
RUN apt-get install -y bzip2
RUN apt-get install -y unzip

RUN apt-get install -y python-setuptools python-dev build-essential cmake git gcc libboost-all-dev libsdl2-dev

#RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
#    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-3.19.0-Linux-x86_64.sh && \
#    /bin/bash /Miniconda2-3.19.0-Linux-x86_64.sh -b -p /opt/conda && \
#    rm Miniconda2-3.19.0-Linux-x86_64.sh && \
#    /opt/conda/bin/conda install --yes conda==3.19.0

RUN easy_install pip
RUN pip install numpy

RUN mkdir /home/vizdoom
RUN git clone https://github.com/Marqt/ViZDoom /home/vizdoom/ViZDoom
RUN cd /home/vizdoom/ViZDoom && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_PYTHON=ON -DBUILD_JAVA=OFF && make
