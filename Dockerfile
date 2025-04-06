FROM quay.io/jupyter/minimal-notebook:python-3.12

USER root

# Install java-17-amazon-corretto-jdk
RUN apt-get update && \
    apt-get install -y gpg && \
    wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list && \
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys A122542AB04F24E3 && \
    apt-get update && \
    apt-get install -y java-17-amazon-corretto-jdk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to jovyan user (default user in jupyter images)
USER ${NB_UID}

# Install Kotlin kernel
RUN pip install kotlin-jupyter-kernel

# Verify the kernel installation
RUN jupyter kernelspec list

# Set working directory
WORKDIR "${HOME}/work"

# Expose the default Jupyter port
EXPOSE 8888

# Start Jupyter notebook
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
