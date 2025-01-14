# Set the MODEL_PATH variable to /mnt/sda/share/alex/models/llama_models
MODEL_PATH=/mnt/hdd0/share/alex/models/LLaMA
# docker run --gpus all --ipc=host --ulimit memlock=-1 -v /home/alex/models:/app/models -p 7860:7860 -it --rm llama
# Check is the model path exists
if [ ! -d "$MODEL_PATH" ]; then
    echo "Model path not found:"
    echo $MODEL_PATH
    exit 1
fi
# set environment variable CKPT_DIR=models/7B
sudo docker run \
    --gpus all \
    --ipc=host \
    --ulimit memlock=-1 \
    -v $MODEL_PATH:/app/models \
    -e CKPT_DIR=models/7B \
    -p 7860:7860 \
    -it \
    --rm llama