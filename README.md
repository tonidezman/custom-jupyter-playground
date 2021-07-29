# Custom Jupyter Playground in Docker

When you clone the repo remember to add /data directory with some sample csv

Start the app:
```bash
# add data/ folder with some sample csv files
$ docker build --tag custom_jupyter_playground .
$ docker run -it --name custom_jupyter_playground -p 8888:8888 custom_jupyter_playground
````
