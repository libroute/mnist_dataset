FROM ruby:2.3

RUN useradd -m user
WORKDIR /home/user
COPY . .
RUN chown user:user *

USER user

CMD ["./run.sh"]
