FROM --platform=linux/amd64 elixir:1.13.4-otp-25-alpine

ENV PGPORT=5432
ENV PGHOST="locahost"
ENV PGUSER="postgres"
ENV PGPASSWORD="postgres"
ENV PGDATABASE="fortress_dev"


RUN apk add nodejs \
postgresql-client \
yarn \
git

# Create app directory and copy the Elixir projects into it.
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install Hex package manager.
RUN mix local.hex --force

RUN mix deps.get

EXPOSE 4000
CMD ["./entrypoint.sh"]
