# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail Comfy_KepListStuff
RUN comfy node install --exit-on-fail comfy-easy-grids
RUN comfy node install --exit-on-fail ComfyUi_String_Function_Tree
RUN comfy node install --exit-on-fail comfyui-textoverlay@1.0.1
RUN comfy node install --exit-on-fail comfyui-impact-pack@8.28.0
RUN comfy node install --exit-on-fail RES4LYF
RUN comfy node install --exit-on-fail comfyui_ultimatesdupscale@1.6.0
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2511270846

# download models into comfyui
# RUN # Could not find URL for uncannyPhotorealism_v10.safetensors
RUN comfy model download --url https://huggingface.co/silveroxides/flan-t5-xxl-encoder-only/blob/main/flan-t5-xxl-fp16.safetensors --relative-path models/clip --filename flan-t5-xxl-fp16.safetensors
RUN comfy model download --url https://github.com/Phhofm/models/releases/download/4xNomosWebPhoto_RealPLKSR/4xNomosWebPhoto_RealPLKSR.safetensors --relative-path models/upscale_models --filename 4xNomosWebPhoto_RealPLKSR.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/Lumina_Image_2.0_Repackaged/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
