FROM ruby:2.7.3

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                      libpq-dev \        
                      nodejs \
                      mariadb-client
# 作業ディレクトリの作成、設定
RUN mkdir /bunsenbako 
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /bunsenbako
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
ENV BUNDLER_VERSION 1.17.3
RUN gem update --system \
    && gem install bundler -v $BUNDLER_VERSION \
    && bundle install
ADD . $APP_ROOT
