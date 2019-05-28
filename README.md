# porechop-docker
Ubuntu 18.04 with porechop installed

The image contains a full install of [porechop](https://github.com/rrwick/Porechop), including all necessary dependencies. I am not part of the porechop team - I just made this image.

In detail, the image is set up with:
 - Ubuntu 18.04
 - Python 3.6.7
 - porechop 0.2.4 

To run [porechop](https://github.com/rrwick/Porechop) you can do the following (this will mount the directory `/in` of the container to the current working directory on your local machine):
```bash
$ docker run --rm -v $(pwd):/in -w /in chrishah/porechop:0.2.4 porechop -h
```

The image includes a simple helper script `porechop.custom` that you can use if you want to configure porechop with your own adapter file (modification of the file `adapters.py` shipping with porechop). The script will recompile porechop with the file that you provide. All flags after the file will be passed to porechop as usual.

For example, the following will recompile porechop with the local file `adapters.pass1.py`, then execute porechop and in this case just display the usage info.
```bash
$ docker run --rm -v $(pwd):/in -w /in chrishah/porechop:0.2.4 bash porechop.custom ./adapters.pass1.py -h
```

You can also enter the container environment and work within it. All executables, e.g. `porechop`, are in the `PATH`.
```bash
$ docker run -it --rm -v $(pwd):/in -w /in chrishah/porechop:0.2.4 /bin/bash
```

