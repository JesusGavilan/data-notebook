ARG SPARK_VERSION=3.3.2
FROM jupyter/pyspark-notebook:spark-${SPARK_VERSION}
LABEL authors="jesus.gavilan"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN pip install spylon-kernel
RUN python -m spylon_kernel install --user
RUN pip install delta-spark
RUN pip install polars