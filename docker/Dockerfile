FROM dbosk/makefiles

RUN pip3 install --no-cache-dir --upgrade lat && \
  ln -f $(find / -name lat.bash) /etc/bash_completion.d
