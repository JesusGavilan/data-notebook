ARG spark_version=3.2.0
FROM jupyter/pyspark-notebook:spark-${spark_version}
LABEL authors="jesus.gavilan"

USER root

ARG almond_version=0.13.7
ARG scala_version=2.12.15

RUN apt-get -y update && \
    apt-get install --no-install-recommends -y \
      curl \
      openjdk-8-jre-headless \
      ca-certificates-java && \
    apt-get clean
USER $NB_UID
RUN mkdir tools
WORKDIR tools
RUN ls
COPY requirements.txt .
RUN curl -Lo coursier https://git.io/coursier-cli && \
    chmod +x coursier
RUN ./coursier launch --fork "almond:${almond_version}" --scala "${scala_version}" -- --install --jupyter-path /opt/conda/share/jupyter/kernels/
RUN pip install -r requirements.txt
WORKDIR "${HOME}"