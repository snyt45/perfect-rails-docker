# perfect-rails-docker
## 使い方

```
# イメージ作成
docker build . -t perfect-rails --build-arg ruby_version=2.6.3 --build-arg rails_version=6.0.1

# コンテナ起動
# fish
docker run -d -t -v (pwd):/app -p 3000:3000 --name="perfect-rails" perfect-rails

# プロジェクト作成、サーバー起動
docker exec -it perfect-rails /bin/bash
rails new sample_app_1
cd sample_app_1
rails s -p 3000 -b '0.0.0.0'

# コンテナ停止、起動
docker stop perfect-rails
docker strat perfect-rails
```