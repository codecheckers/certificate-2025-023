FROM python:3.6.6-slim

# Upgrade pip for Python 3.6 compatibility
RUN pip install --upgrade "pip<22" setuptools wheel

# Install numpy first (needed by pyabf)
RUN pip install numpy==1.16.2

# Install the rest
RUN pip install \
    matplotlib==3.0.2 \
    seaborn==0.9.0 \
    pyabf==2.1.6 \
    pandas==0.24.1 \
    scipy==1.3.0 \
    xlrd==1.0.0

WORKDIR /app
COPY . /app

CMD ["python", "Gapfree_AP_stim.py", "Sample_data/2019_03_16_0000.abf", "1", "6"]