ARG SPARK_VERSION=3.3.2
FROM jupyter/pyspark-notebook:spark-${SPARK_VERSION}
LABEL authors="jesus.gavilan"

USER root
RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
      curl \
      openjdk-8-jre-headless \
      ca-certificates-java && \
    apt-get clean
USER $NB_UID
RUN curl -Lo coursier https://git.io/coursier-cli
RUN chmod +x coursier
RUN ./coursier launch --fork almond:0.13.6 --scala 2.12.15 -- --install --jupyter-path /opt/conda/share/jupyter/kernels/
RUN pip install delta-spark
RUN pip install polars