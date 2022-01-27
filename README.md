# bag2mp4

## Overview

Simple ROS tool to transform [CompressedImage's](https://docs.ros.org/en/api/sensor_msgs/html/msg/CompressedImage.html) topics into MP4 videos.

## Setup

Clone this repository in your catkin_ws and compile it:

```bash
roscd && cd ..
catkin_make
rospack profile
```

Install the required run-time dependencies using the provided scripts:

```bash
roscd && cd ../src
bash setup.sh
```

## Usage

First, transform your bag file topic into JPG images using the following command:

```bash
roslaunch bag2mp4 extract_bag_images.launch bag_file:=<FULL_PATH_TO_BAG_FILE>  bag_compressed_image_topic:=<IMAGE_TOPIC_NAME>
```

Important notes:

* The extracted images are saved at the folder `~/home/<USER>/bag2mp4`, that will be created automatically.
* <IMAGE_TOPIC_NAME> must be replaced by the compressed topic name but without the `/compressed` suffix. For example, if your bag file contains the topic `/usb_cam/image_raw/compressed`, you must write here `/usb_cam/image_raw`, although this topic does not exist
* In case your bag file also contains the image raw topic, add the option: `bag_contains_raw_topic:=true`.
* By default, this command will try to extract all the images from the topic at 100 Hz. In case the number of extracted frames is higher/lower than the number of messages in the topic (check it for example using `rqt_bag info <bag_name>`), please, fine-tune this argument.

Finally, generated the video from these images executing:

```bash
rosrun bag2mp4 images2video.sh <TOPIC_FRAME_RATE>
```

replacing <TOPIC_FRAME_RATE> by the rate of the topic in the bag file (check it for example running the bag file and using `rostopic hz <topic_name>`).