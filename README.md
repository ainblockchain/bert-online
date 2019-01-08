# bert-online

An online version of [`BERT`](https://arxiv.org/abs/1810.04805) for [`AI Network`](https://ainetwork.ai/). The source code is originated in [`github.com/google-research/bert`](https://github.com/google-research/bert) and was modified for our purpose. For the full context of the code, see the original code.

## How to run on [`AIN Cloud Beta`](https://cloud.ainetwork.ai/)

*See [`AIN.md`](https://github.com/ainblockchain/bert-online/blob/master/AIN.md) for a guide to play with the code on [`AIN Cloud Beta`](https://cloud.ainetwork.ai/), which is a product provided by [`AI Network`](https://ainetwork.ai/).*

## How to run using commandlines

It can be run in [`Docker`](https://docs.docker.com/) containers using the commandlines below:

### Run w/ tensorflow docker image (on CPU machine): 

NOTE: You need to train the model first before using the commandline below (See [`How to train BERT models`](https://github.com/ainblockchain/bert-online#how-to-train-bert-models)).
```bash
DOCKER_BERT_DIR=/bert
TF_CPP_MIN_LOG_LEVEL=2

docker run -v $PWD:/bert \
  -w /bert \
  --env PYTHONPATH=/bert \
  --rm tensorflow/tensorflow \
  python /bert/bert_online/run_squad_online.py \
  --vocab_file=$DOCKER_BERT_DIR/model_base_cased/vocab.txt \
  --bert_config_file=$DOCKER_BERT_DIR/model_base_cased/bert_config.json \
  --init_checkpoint=$DOCKER_BERT_DIR/squad1.1-output-train_2/model.ckpt-14599 \
  --max_seq_length=320 \
  --doc_stride=128 \
  --n_best_size=3
```

### Run w/ bert-online docker image (on CPU machine): 

```bash
docker run -v $PWD/bert_online:/bert/bert_online \
  -w /bert \
  --env PYTHONPATH=/bert \
  -t --rm comcomai/bert-online:1.0.0 \
  python /bert/bert_online/run_squad_online.py \
  --vocab_file=/bert/model_base_cased/vocab.txt \
  --bert_config_file=/bert/model_base_cased/bert_config.json \
  --init_checkpoint=/bert/squad1.1-output-train_2/model.ckpt-14599 \
  --max_seq_length=320 \
  --doc_stride=128 \
  --n_best_size=3
```

### Run w/ tensorflow-gpu docker image (on GPU machine): 

NOTE: You need to train the model first before using the commandline below (See [`How to train BERT models`](https://github.com/ainblockchain/bert-online#how-to-train-bert-models)).
```bash
DOCKER_BERT_DIR=/bert

docker run -v $PWD:/bert \
  -w /bert \
  --env PYTHONPATH=/bert \
  --runtime=nvidia --rm tensorflow/tensorflow:1.12.0-rc2-gpu \
  python /bert/bert_online/run_squad_online.py \
  --vocab_file=$DOCKER_BERT_DIR/model_base_cased/vocab.txt \
  --bert_config_file=$DOCKER_BERT_DIR/model_base_cased/bert_config.json \
  --init_checkpoint=$DOCKER_BERT_DIR/squad1.1-output-train_2/model.ckpt-14599 \

--max_seq_length=320 \
  --doc_stride=128 \
  --n_best_size=3
```

### Run w/ bert-online-gpu docker image (on GPU machine): 

```bash
docker run -v $PWD/bert_online:/bert/bert_online \
  -w /bert \
  --env PYTHONPATH=/bert \
  --runtime=nvidia -t --rm comcomai/bert-online:1.0.0-gpu \
  python /bert/bert_online/run_squad_online.py \
  --vocab_file=/bert/model_base_cased/vocab.txt \
  --bert_config_file=/bert/model_base_cased/bert_config.json \
  --init_checkpoint=/bert/squad1.1-output-train_2/model.ckpt-14599 \
  --max_seq_length=320 \
  --doc_stride=128 \
  --n_best_size=3
```

## How to train BERT models

BERT models can be trained using the commandlines below.

For more details, please refer to [`BERT GitHub README`](https://github.com/google-research/bert/blob/master/README.md). 

### Download pre-trained model

Download [`BERT-Base, Cased`](https://storage.googleapis.com/bert_models/2018_10_18/cased_L-12_H-768_A-12.zip) model files and put them under model_base_cased directory. 

### Download SQuAD files

Download SQuAD1.1 files and put them under squad1.1 directory:
*   [train-v1.1.json](https://rajpurkar.github.io/SQuAD-explorer/dataset/train-v1.1.json)
*   [dev-v1.1.json](https://rajpurkar.github.io/SQuAD-explorer/dataset/dev-v1.1.json)
*   [evaluate-v1.1.py](https://github.com/allenai/bi-att-flow/blob/master/squad/evaluate-v1.1.py)

### Download BERT code

Download [`BERT`](https://github.com/google-research/bert) source code and put them under bert directory.

### Train BERT model (on GPU machine):

```bash
DOCKER_BERT_BASE_DIR=/bert/model_base_cased
DOCKER_SQUAD_DIR=/bert/squad1.1
DOCKER_OUTPUT_DIR=/bert/squad1.1-output

docker run -v  $PWD:/bert \
  -w /bert \
  --runtime=nvidia --rm tensorflow/tensorflow:latest-gpu \
  python /bert/bert/run_squad.py \
  --vocab_file=$DOCKER_BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$DOCKER_BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$DOCKER_BERT_BASE_DIR/bert_model.ckpt \
  --do_train=True \
  --train_file=$DOCKER_SQUAD_DIR/train-v1.1.json \
  --do_predict=True \
  --predict_file=$DOCKER_SQUAD_DIR/dev-v1.1.json \
  --train_batch_size=12 \
  --learning_rate=3e-5 \
  --num_train_epochs=2.0 \
  --max_seq_length=320 \
  --doc_stride=128 \
  --output_dir=$DOCKER_OUTPUT_DIR 
```

## How to build Docker images

Docker images can be built using the commandlines below:

### Build bert-online docker image (for CPU machine):

```bash
docker build -t bert-online .
docker tag bert-online:latest comcomai/bert-online:1.0.0
docker push comcomai/bert-online:1.0.0
docker pull comcomai/bert-online:1.0.0
```

### Build bert-online-gpu docker image (for GPU machine):

```bash
vi Dockerfile  # Change tensorflow/tensorflow:1.12.0-rc2 to tensorflow/tensorflow:1.12.0-rc2-gpu 
docker build -t bert-online-gpu .
docker tag bert-online:latest comcomai/bert-online:1.0.0-gpu
docker push comcomai/bert-online:1.0.0-gpu
docker pull comcomai/bert-online:1.0.0-gpu
```

## License

Copyright 2018 Common Computer Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
