FROM m0elnx/alpine-x86
MAINTAINER Emmanuel Hadoux <emmanuel.hadoux@gmail.com>
WORKDIR /usr/local/app
RUN apk add --no-cache libstdc++ python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    rm -r /root/.cache
RUN mkdir tmp
EXPOSE 6000
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY api.py .
COPY BalanceSpan/algo/BalanceSpan .
COPY BalanceSpan/tests/example/binit .
COPY BalanceSpan/tests/example/sc2replay_converter.py .
ENTRYPOINT ["gunicorn", "-b 127.0.0.1:6000", "api:app"]