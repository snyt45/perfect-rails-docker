ARG ruby_version
FROM ruby:${ruby_version}

# nodejsをインストール
RUN curl -LO https://nodejs.org/dist/v12.18.3/node-v12.18.3-linux-x64.tar.xz
RUN tar xvf node-v12.18.3-linux-x64.tar.xz
RUN mv node-v12.18.3-linux-x64 node
ENV PATH /node/bin:$PATH

# yarnをセットアップする
# 公式ドキュメントまま https://classic.yarnpkg.com/ja/docs/install/#alternatives-stable
RUN curl -o- -L https://yarnpkg.com/install.sh | bash
ENV PATH /root/.yarn/bin:/root/.config/yarn/global/node_modules/.bin:$PATH

ARG rails_version
RUN gem install rails -v "${rails_version}"

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT
