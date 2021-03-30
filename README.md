# shadow.docker

A Dockerfile for the @Shadow discrete-event network simulator. The image is 
available on [Docker Hub](https://hub.docker.com/r/dbosk/shadow).

To use it, run
```bash
docker run -it --tmpfs /dev/shm:rw,nosuid,nodev,exec,size=1g dbosk/shadow
```
Probably you must adjust the `size` parameter.

There are probably other parameters that you must also adjust. See [the 
documentation][shadow-doc]. But remember that the `sysctl` commands affect the 
kernel, so those settings are changed outside the Docker image. In fact, you 
can pass (some of) them to `docker` directly, see the [Docker 
documentation][docker-doc].

[shadow-doc]: https://github.com/shadow/shadow/blob/main/docs/1.1-Shadow.md#system-configs-and-limits
[docker-doc]: https://docs.docker.com/engine/reference/commandline/run/#configure-namespaced-kernel-parameters-sysctls-at-runtime
