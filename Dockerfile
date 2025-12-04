
echo "Worker Initiated"

echo "Symlinking files from Network Volume"
rm -rf /workspace && \
  ln -s /runpod-volume /workspace

echo "Go base worker startup"
# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base


# install custom nodes into comfyui
#jamieRUN comfy node install --exit-on-fail Comfy_KepListStuff
#jamieRUN comfy node install --exit-on-fail comfy-easy-grids
#jamieRUN comfy node install --exit-on-fail ComfyUi_String_Function_Tree
#jamieRUN comfy node install --exit-on-fail comfyui-textoverlay@1.0.1
#jamieRUN comfy node install --exit-on-fail comfyui-impact-pack@8.28.0
#jamieRUN comfy node install --exit-on-fail RES4LYF
#jamieRUN comfy node install --exit-on-fail comfyui_ultimatesdupscale@1.6.0
#jamieRUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511270846

# download models into comfyui
# RUN # Could not find URL for uncannyPhotorealism_v10.safetensors
#jamieRUN comfy model download --url https://huggingface.co/silveroxides/flan-t5-xxl-encoder-only/blob/main/flan-t5-xxl-fp16.safetensors --relative-path models/clip --filename flan-t5-xxl-fp16.safetensors
#jamieRUN comfy model download --url https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.safetensors --relative-path models/upscale_models --filename 4xNomosWebPhoto_RealPLKSR.safetensors
#jamieRUN comfy model download --url https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
