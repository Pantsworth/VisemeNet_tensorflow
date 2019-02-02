# VisemeNet Code Readme

## Input/Output

+ Input audio needs to be 44.1kHz, 16-bit, WAV format
+ Output visemes are applicable to the JALI-based face-rig, see [HERE](http://www.dgp.toronto.edu/~elf/jali.html)

## JALI Viseme Annotation Dataset

+ BIWI dataset with well-annotated JALI viseme parameters. [[DATASET](https://www.dropbox.com/sh/oj13tvq9ggf2puz/AADBPyRUcyisFtKgCoDmNhLHa?dl=0)]   [[README](VisemeNet_Annotation_README.md)]

## Local Install
1). **Ensure you have the following installed:**
> Python 3.5

> Tensorflow 1.1.0

> Cudnn 5.0

2). **Create and install required envs and packages**
```
conda create -n visnet python=3.5

# take care of your OS and python version, here is a Linux-64bit with Python3.5 link
pip install --ignore-installed --upgrade https://download.tensorflow.google.cn/linux/gpu/tensorflow_gpu-1.1.0-cp35-cp35m-linux_x86_64.whl 

pip install -r requirements.txt
```

3). **Download this repository to your local machine:**  
```
git clone https://github.com/yzhou359/VisemeNet_tensorflow.git  
cd VisemeNet_tensorflow 
```

## Docker Install
1) Install docker and nvidia drivers, then install nvidia-docker (https://github.com/NVIDIA/nvidia-docker)

2) Build the container
```
git clone https://github.com/Pantsworth/VisemeNet_tensorflow.git
cd VisemeNet_tensorflow/
nvidia-docker build . --tag visemenet:latest
```

3) Run the container (this will drop you at a bash prompt inside the container).  
```
nvidia-docker run -it -p 8888:8888 visemenet:latest bash
```

## Running Examples
1). **Prepare data and model:**  
   * convert your test audio files into WAV format, put it to the directory data/test_audio/   
   * download the public face rig model from [HERE](https://www.dropbox.com/sh/7nbqgwv0zz8pbk9/AAAghy76GVYDLqPKdANcyDuba?dl=0), put all 4 files to data/ckpt/pretrain_biwi/  

2). **Forward inference:**  
   * put your test audio file name in file 'main_test.py', line 7. 
   * Then run command line

```
python main_test.py
```

   &nbsp; &nbsp; The result locates at:  
   &nbsp; &nbsp; &nbsp; &nbsp; data/output_viseme/[your_audio_file_name]/mayaparam_viseme.txt

3). **JALI animation in Maya:**
   * put your test audio file name in file 'maya_animation.py', line 4.
   * Then run 'maya_animation.py' in Maya with JALI environment to create talking face animation automatically. (If using different version of JALI face rig, the name of phoneme/co-articulation variable might varies.)
   * UPDATE: 'maya_animation.py' has been updated with the [public face rig](http://www.dgp.toronto.edu/~elf/jali.html) annotations. Feel free to play with it!

