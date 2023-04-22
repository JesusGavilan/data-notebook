# data-notebook
Data notebook based on Jupyter.
Current docker image includes Almond, a Scala kernel for Jupyter.
Current docker image includes Polars and delta-spark libraries.
Versions:
* Scala 2.13.15
* Python 3.9.7
* Spark 3.2.0
* Delta 2.0.1
* Polars 0.17.3

## Usage
### Configure the workspace for your notebooks and datasets
Inside the project create a .env file with the next content:
```bash
WORKING_DIR=<directory-path-where-you-want-to-store-your-notebooks>
DATASET_DIR=<directory-path-where-you-want-to-store-your-datasets>

```
### Build the docker image
```bash
docker-compose build
```
### Run the docker image
```bash
docker-compose up
```




