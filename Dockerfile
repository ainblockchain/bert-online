# 1. Install Tensorflow
FROM       tensorflow/tensorflow:1.12.0-rc2
MAINTAINER contact@comcom.ai

# 2. Copy basic model files
COPY ./model_base_cased /bert/model_base_cased

# 3. Copy fine-tuned model checkpoint
COPY ./squad1.1-output-train_2 /bert/squad1.1-output-train_2

# 3. Copy BERT source code
COPY ./bert /bert/bert

# 4. Set working directory
WORKDIR /bert

# 5. Start with bash
CMD ls
