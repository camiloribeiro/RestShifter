FROM ruby

RUN gem install rest_shifter -v 0.0.27
ENTRYPOINT ["rest_shifter"]
