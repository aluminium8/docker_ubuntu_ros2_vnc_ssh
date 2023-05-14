# prepare os and some package
FROM tiryoh/ros2-desktop-vnc:foxy
RUN apt update
RUN apt -y upgrade
RUN apt install -y cmake g++ wget unzip bzip2
RUN apt install -y git

#boost check
ENV BOOST_DIR /boost/build
ADD library_checker/cpp_boost_lib_test/ /home/test/library_checker/cpp_boost_lib_test/
WORKDIR /home/test/library_checker/cpp_boost_lib_test/build
RUN pwd
RUN cmake ..
RUN make
RUN ./boost_test >../../boost_version.txt

#pcl check
ADD library_checker/cpp_pcl_lib_test/ /home/test/library_checker/cpp_pcl_lib_test/
WORKDIR /home/test/library_checker/cpp_pcl_lib_test/build
RUN pwd
RUN cmake ..
RUN make
RUN ./pcl_test> ../../pcl_version.txt

#opencv check
ADD library_checker/cpp_opencv_lib_test/ /home/test/library_checker/cpp_opencv_lib_test/
WORKDIR /home/test/library_checker/cpp_opencv_lib_test/build
RUN pwd
RUN cmake ..
RUN make
RUN ./opencv_test > ../../opencv_version.txt



RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
RUN cat /etc/supervisor/conf.d/supervisord.conf
COPY ssh_supervisord.conf /home/ubuntu/sshd_supervisord.conf
RUN cat /home/ubuntu/sshd_supervisord.conf>>/etc/supervisor/conf.d/supervisord.conf
RUN cat /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80 5900
CMD ["/usr/bin/supervisord"]