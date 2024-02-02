#!/bin/bash

# Run this to download extra stuff after running the container in a pod via SSH

CHECKPOINT_MODELS=(
    # "https://civitai.com/api/download/models/293564"
    # "https://civitai.com/api/download/models/288982"
    # "https://civitai.com/api/download/models/130072"
    # "https://civitai.com/api/download/models/46846"
)

LORA_MODELS=(
)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    #"https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    #"https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    #"https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    # "https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/kohya_controllllite_xl_depth.safetensors"
    # "https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/sai_xl_depth_128lora.safetensors"
    # "https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/sai_xl_depth_256lora.safetensors"
    # "https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/thibaud_xl_openpose.safetensors"
    # "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/control/mm_sd15_v3_sparsectrl_rgb.safetensors"
    # "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/control/mm_sd15_v3_sparsectrl_scribble.safetensors"
)

SADTALKER_MODELS=(
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00109-model.pth.tar"
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00229-model.pth.tar"
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_256.safetensors"
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_512.safetensors"
)

ANIMATEDDIFF_MODELS=(
    # "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/motion_module/mm_sdxl_hs.safetensors"
    # "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/motion_module/mm_sd15_v3.safetensors"
    # "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/control/mm_sd15_v3_sparsectrl_rgb.safetensors"
    # "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/control/mm_sd15_v3_sparsectrl_scribble.safetensors"
)

IP_ADAPTER_XL=(
    # "https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth"
)

SADTALKER_CHECKPOINTS="${WORKSPACE}/stable-diffusion-webui/models/sadtalker"

function build_extra_start() {
    source /opt/ai-dock/etc/environment.sh
    build_extra_get_extensions
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/models/Stable-diffusion" \
        "${CHECKPOINT_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/models/lora" \
        "${LORA_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/models/vae" \
        "${VAE_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/models/sadtalker" \
        "${SADTALKER_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/extensions/sd-webui-animatediff.git/model" \
        "${ANIMATEDDIFF_MODELS[@]}"
    build_extra_get_models \
        "${WORKSPACE}/stable-diffusion-webui/extensions/sd-webui-controlnet/models" \
        "${IP_ADAPTER_XL[@]}"
   
    cd /opt/stable-diffusion-webui && \
        micromamba run -n webui -e LD_PRELOAD=libtcmalloc.so python launch.py \
        --use-cpu all \
        --skip-torch-cuda-test \
        --skip-python-version-check \
        --no-download-sd-model \
        --do-not-download-clip \
        --no-half \
        --port 11404 \
        --exit
    
    # Ensure pytorch hasn't been clobbered
    $MAMBA_DEFAULT_RUN python /opt/ai-dock/tests/assert-torch-version.py
}

function build_extra_get_extensions() {
    for repo in "${EXTENSIONS[@]}"; do
        dir="${repo##*/}"
        path="/opt/stable-diffusion-webui/extensions/${dir}"
        requirements="${path}/requirements.txt"
        if [[ -d $path ]]; then
            if [[ ${AUTO_UPDATE,,} != "false" ]]; then
                printf "Updating extension: %s...\n" "${repo}"
                ( cd "$path" && git pull )
                if [[ -e $requirements ]]; then
                    micromamba -n webui run ${PIP_INSTALL} -r "$requirements"
                fi
            fi
        else
            printf "Downloading extension: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
            if [[ -e $requirements ]]; then
                micromamba -n webui run ${PIP_INSTALL} -r "${requirements}"
            fi
        fi
    done
}

function build_extra_get_models() {
    if [[ -n $2 ]]; then
        dir="$1"
        mkdir -p "$dir"
        shift
        arr=("$@")
        
        printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"
        for url in "${arr[@]}"; do
            printf "Downloading: %s\n" "${url}"
            build_extra_download "${url}" "${dir}"
            printf "\n"
        done
    fi
}

# Download from $1 URL to $2 file path
function build_extra_download() {
    wget -qnc --content-disposition --show-progress -e dotbytes="${3:-4M}" -P "$2" "$1"
}

build_extra_start