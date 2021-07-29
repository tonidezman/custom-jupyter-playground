FROM debian:buster

RUN apt update
RUN apt install python3-pip python3-dev -y

RUN pip3 install pandas
RUN pip3 install jupyter
RUN pip3 install jupyterlab
RUN pip3 install jupyterthemes

# Install vim plugin for Jupyter Notebook
RUN apt install git -y
RUN mkdir -p $(jupyter --data-dir)/nbextensions
RUN cd $(jupyter --data-dir)/nbextensions && git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

# chose jupyter theme
RUN jt -t onedork

WORKDIR /app
COPY ./data ./data

EXPOSE 8888
CMD exec jupyter notebook --ip 0.0.0.0 --no-browser --allow-root
