FROM python:3.8.0

COPY requirements.txt /

# Set up packages
RUN apt-get update
RUN apt-get install libopus0
RUN apt-get install nano # TODO: TEMPORARY
# Set up Python environment
RUN pip install -r requirements.txt
# Set up user
RUN useradd -ms /bin/bash mirorbot
USER mirorbot
WORKDIR /home/mirorbot
# Clone and launch Miror B.ot
RUN git clone --recurse-submodules  https://github.com/Fakas/mirorbot.git
WORKDIR /home/mirorbot/mirorbot
ENTRYPOINT ["./miror_bot.sh"]
CMD []
