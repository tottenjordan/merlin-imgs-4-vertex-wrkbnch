FROM nvcr.io/nvidia/merlin/merlin-pytorch:22.12
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-sdk -y
EXPOSE 8080

# copy the dependencies file to the working directory
COPY merlin_container/requirements.txt .
# install dependencies
RUN apt-get install nodejs npm -y
RUN pip install -r requirements.txt
#RUN mkdir /root/.jupyter
             
COPY merlin_container/jupyter_notebook_config.py /root/.jupyter

ENV pwd=""
ENTRYPOINT exec jupyter-lab --ip=0.0.0.0 --port=8080 --no-browser --allow-root --ServerApp.allow_origin="*" --NotebookApp.token="$pwd" --NotebookApp.password="$pwd"
