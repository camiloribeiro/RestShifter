FROM ruby

RUN gem install rest_shifter
ENTRYPOINT ["rest_shifter"]
