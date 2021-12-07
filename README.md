# maven-3-openjdk-11-docker-client

Maven with docker client.

To find the latest major and minor versions to tag use:

```bash
docker_image_find_tag.sh -n maven -i maven:3-openjdk-11
```

Example output:
```bash
Found Total Tags: 597                                                                                                                                   
Limiting Tags to: 100                                                                                                                                   
Limit reached, consider increasing limit (-l [number]) or adding a filter (-f [text])                                                                 
                                                                                                                                                                                                                   
Checking for image match..                                                                                                                           
Found match. tag: 3.8.4-openjdk-11                                                                                                                   
Image ID Target: sha256:67370aadf332573d490d6f02718b69734724adae08ad0ed721b42a43cc37d55b                                                              
Image ID Source: sha256:67370aadf332573d490d6f02718b69734724adae08ad0ed721b42a43cc37d55b                                                                                                                           
Found match. tag: 3.8.4-jdk-11                                                                                                                        
Image ID Target: sha256:67370aadf332573d490d6f02718b69734724adae08ad0ed721b42a43cc37d55b
Image ID Source: sha256:67370aadf332573d490d6f02718b69734724adae08ad0ed721b42a43cc37d55b
```

From above, we observe that the major version is `8` and minor is `4`.

Use them in the build and push script:
```bash
./build-and-push.sh 8 4
```
