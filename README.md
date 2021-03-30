# shadow.docker

A Dockerfile for the @Shadow discrete-event network simulator. The image is 
available on [Docker Hub](https://hub.docker.com/r/dbosk/shadow).

To use it, run
```bash
docker run -it --tmpfs /dev/shm:rw,nosuid,nodev,exec,size=1g dbosk/shadow
```
Probably you must adjust the `size` parameter.

There are probably other parameters that you must also adjust. See [the 
documentation][shadow-doc].

[shadow-doc]: https://github.com/shadow/shadow/blob/main/docs/1.1-Shadow.md#system-configs-and-limits
