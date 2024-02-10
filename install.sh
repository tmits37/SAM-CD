# Please Insults following location infos.
# you can get LOCAL_PYTHON_SITEPACKAGES_ROOT from "python3 -m site"
LOCAL_PYTHON_SITEPACKAGES_ROOT="/usr/local/lib/python3.8/site-packages"
LOCAL_DATA_ROOT="/nas/k8s/dev/research/doyoungi/git/SAM-CD/data/levir_cd"

# 1. INSTALLATION
git clone https://github.com/CASIA-IVA-Lab/FastSAM.git
cd FastSAM
pip install -r requirements.txt
pip install git+https://github.com/openai/CLIP.git
cd ..

cp -f utils/paste_these_over_ultralytics/predictor.py $LOCAL_PYTHON_SITEPACKAGES_ROOT/ultralytics/yolo/engine/predictor.py
cp -f utils/paste_these_over_ultralytics/head.py $LOCAL_PYTHON_SITEPACKAGES_ROOT/ultralytics/nn/modules/head.py
cp -f utils/paste_these_over_ultralytics/tasks.py $LOCAL_PYTHON_SITEPACKAGES_ROOT/ultralytics/nn/tasks.py

# 2. Dataset
# Download Levir_CD Dataset from
# https://drive.google.com/drive/folders/1dLuzldMRmbBNKPpUkX8Z53hi6NHLrWim
# and unzip it to LOCAL_DATA_ROOT
sed -i "s|root = '/YOUR_DATA_ROOT/'|root = '$LOCAL_DATA_ROOT'|g" datasets/Levir_CD.py

# 3. Train
# python3 train_SAM_CD.py

# 4. Validation
# python3 pred_CD.py --chkpt_path work_dirs/pretrained_weights/LevirCD_SAM_CD_e42_OA99.24_F86.73_IoU79.30.pth --pred-dir <pred_dir>

# 5. Evaluation
# python3 eval_CD.py --pred-dir <pred_dir>


