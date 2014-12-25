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
open_api_key  = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
close_api_key = 'yyyyyyyyyyyyyyyyyyyyyyyyyyyyy'
delivery_id   = 'zzzzzzzzzzzzzzzzzzzzzzzzzzzzz'
message_id    = 'ccccccccccccccccccccccccccccc'

# настройте клиент для работы с Billingrad API
client = Billingrad::Client.new(
  open: open_api_key,
  close: close_api_key,
  did:  delivery_id
)

# отправка sms-сообщения
@client.send(
  to: '+79261234567',
  text: 'Привет! Это тестовое сообщение!'
)

# получение данных по отправленному сообщению
@client.info(
  mid: message_id
)
```

## Ваш вклад в проект

1. Форкните репозиторий ( https://github.com/hats/billingrad-api-ruby/fork )
2. Создайте ветку для ваших изменений (`git checkout -b my-new-feature`)
3. Зафиксируйте ваши изменения (`git commit -am 'Add some feature'`)
4. Отправьте ваши изменения в репозиторий (`git push origin my-new-feature`)
5. Создайте запрос на изменения

ENJOY!