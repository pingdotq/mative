FROM elixir:latest

RUN mkdir /app
WORKDIR /app
COPY ./mix.exs .

RUN mix local.hex --force

COPY . .
