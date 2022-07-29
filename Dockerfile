FROM --platform=linux/amd64 elixir:1.13.4-otp-25-alpine

ENV PGPORT=5432
ENV PGHOST="locahost"
ENV PGUSER="postgres"
ENV PGPASSWORD="postgres"
ENV PGDATABASE="fortress_dev"
ENV CERTFILE="$CERTFILE"
ENV KEYFILE="$KEYFILE"


RUN apk add nodejs \
postgresql-client \
yarn \
git

# Create app directory and copy the Elixir projects into it.
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mkdir ./priv/cert
RUN echo $CERTFILE > ./priv/cert/cert.pem
RUN echo $KEYFILE > ./priv/cert/cert.key
# Install Hex package manager.
RUN mix local.hex --force

RUN mix deps.get

EXPOSE 4001
CMD ["./entrypoint.sh"]
