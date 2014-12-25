# BILLINGRAD-API-RUBY

BILLINGRAD-API-RUBY - gem-обертка над API сервиса рассылок sms-сообщений [Billingrad](http://billingrad.com/).

## Установка

Добавьте строку ниже в Gemfile вашего приложения:

```ruby
gem 'billingrad-api-ruby', github: 'hats/billingrad-api-ruby'
```

После чего выполните команду:

    $ bundle

## Использование

``` ruby
require 'rubygems'
require 'billingrad-api-ruby'

# укажите ваши данные здесь
open_api_key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
delivery_id  = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyy'

# настройте клиент для работы с Billingrad API
@client = Billingrad::Client.new open_api_key, delivery_id

# отправка sms-сообщения
@client.send(
  to: '+79261234567',
  text: 'Привет! Это тестовое сообщение!'
)
```

## Ваш вклад в проект

1. Форкните репозиторий ( https://github.com/hats/billingrad-api-ruby/fork )
2. Создайте ветку для ваших дополнений (`git checkout -b my-new-feature`)
3. Зафиксируйте ваши изменения (`git commit -am 'Add some feature'`)
4. Запуште ваши изменения в репозиторий (`git push origin my-new-feature`)
5. Создайте новый запрос на изменения

ENJOY!