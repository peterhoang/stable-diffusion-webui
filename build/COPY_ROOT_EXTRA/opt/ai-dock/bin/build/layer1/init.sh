#!/bin/bash

# Use this layer to add nodes and models

MAMBA_PACKAGES=(
    #"package1"
    #"package2=version"
  )
  
PIP_PACKAGES=(
    #"package1==version"
    #"package2"
  )


EXTENSIONS=(
    #"https://github.com/Mikubill/sd-webui-controlnet"
    #"https://github.com/d8ahazard/sd_dreambooth_extension"
    #"https://github.com/deforum-art/sd-webui-deforum"
    #"https://github.com/adieyal/sd-dynamic-prompts"
    #"https://github.com/ototadana/sd-face-editor"
    #"https://github.com/AlUlkesh/stable-diffusion-webui-images-browser"
    #"https://github.com/hako-mikan/sd-webui-regional-prompter"
    #"https://github.com/Coyote-A/ultimate-upscale-for-automatic1111"
    #"https://github.com/fkunn1326/openpose-editor"
    #"https://github.com/Gourieff/sd-webui-reactor"
    "https://github.com/OpenTalker/SadTalker"
    "https://github.com/Iyashinouta/sd-model-downloader"
    #"https://github.com/continue-revolution/sd-webui-animatediff.git"
)

CHECKPOINT_MODELS=(
    #"https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/sd_xl_base_1.0.safetensors"
    #"https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/resolve/main/sd_xl_refiner_1.0.safetensors"
    # "https://civitai.com/api/download/models/293564"
    # "https://civitai.com/api/download/models/288982"
    # "https://civitai.com/api/download/models/130072"
    # "https://civitai.com/api/download/models/46846"
)

LORA_MODELS=(
    #"https://civitai.com/api/download/models/16576"
    "https://civitai.com/api/download/models/62833"
    "https://civitai.com/api/download/models/87153?type=Model&format=SafeTensor"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_PanLeft.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_PanRight.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_RollingAnticlockwise.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_RollingClockwise.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_TiltDown.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_TiltUp.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_ZoomIn.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v2_lora_ZoomOut.safetensors"
    "https://huggingface.co/conrevo/AnimateDiff-A1111/resolve/main/lora_v2/mm_sd15_v3_adapter.safetensors"
    "https://civitai.com/api/download/models/219642"

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
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/kohya-ss/ControlNet-diff-modules/resolve/main/diff_control_sd15_depth_fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)

SADTALKER_MODELS=(
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00109-model.pth.tar"
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00229-model.pth.tar"
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_256.safetensors"
    "https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_512.safetensors"
)

### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function build_extra_start() {
    source /opt/ai-dock/etc/environment.sh
    build_extra_get_mamba_packages
    build_extra_get_pip_packages
    build_extra_get_extensions
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    build_extra_get_models \
        "/opt/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
   
    cd /opt/stable-diffusion-webui && \
        micromamba run -n webui \
        -e LD_PRELOAD=libtcmalloc.so python launch.py \
        -e COMMANDLINE_ARGS=--disable-safe-unpickle \
        -e SADTALKER_CHECKPOINTS=/models/SadTalker \
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

function build_extra_get_mamba_packages() {
    if [[ -n $MAMBA_PACKAGES ]]; then
        $MAMBA_INSTALL -n webui ${MAMBA_PACKAGES[@]}
    fi
}

function build_extra_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
        micromamba run -n webui $PIP_INSTALL ${PIP_PACKAGES[@]}
    fi
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
        chmod +rwx "${path}"
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