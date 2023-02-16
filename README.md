# merlin-imgs-4-vertex-wrkbnch

to build your own or customize, follow notebook `create-merlin-image.ipynb`

to build the exact image in this repo, follow these from terminal:

```
git clone https://github.com/tottenjordan/merlin-imgs-4-vertex-wrkbnch.git

PROJECT_ID=<YOUR PROJECT ID> # change to your project id.
IMAGE_URI=gcr.io/${PROJECT_ID}/merlin-pytorch-22.12
REPO_DOCKER_PATH_PREFIX=src
FILE_LOCATION=./$REPO_DOCKER_PATH_PREFIX
FRAMEWORK=pytorch
MACHINE_TYPE=e2-highcpu-32


gcloud builds submit --config $REPO_DOCKER_PATH_PREFIX/cloudbuild.yaml \
  --substitutions _DOCKERNAME=$FRAMEWORK,_IMAGE_URI=$IMAGE_URI,_FILE_LOCATION=$FILE_LOCATION \
  --timeout=2h \
  --machine-type=$MACHINE_TYPE
```