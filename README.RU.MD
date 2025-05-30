![Citeck ECOS Logo](https://raw.githubusercontent.com/Citeck/ecos-ui/master/public/img/logo/ecos-logo.svg)

# Citeck Community

**На других языках: [Английский](README.md)**

Данный репозиторий представляет собой настройку Docker Compose для запуска «Citeck Community». 

**Citeck** – система управления корпоративным контентом, позволяющая управлять бизнес-процессами, документами и задачами.

## Предварительные условия

Убедитесь, что установлены следующие необходимые компоненты и соблюдены требования к ОЗУ:

- Docker: [Установка Docker](https://docs.docker.com/engine/install/)
- Docker Compose: [Установка Docker Compose](https://docs.docker.com/compose/install/)
- 16 ГБ ОЗУ для корректной работы Docker

## Установка

#### 1. Клонируйте репозиторий

```bash
git clone https://github.com/citeck/citeck-community.git
```

**Note**: 
citeck-community поставляется с предзаполненными демонстрационными данными. 
Для отключения перед разворачиванием стенда перейдите в папку `\services\environments` в файле `demo_data.env` в настройке `WITH_DEMO_DATA` измените **true** на **false**

#### 2. Перейдите в папку с клонированным репозиторием :

```bash
cd citeck-community
```

#### 3. Запустите Docker Compose:

```bash
docker-compose up -d
```

Команда запустит необходимые контейнеры Docker. Загрузка образов и настройка окружений может занять некоторое время.

#### 4. Доступ к Citeck Community:

Перейдите в браузере по адресу `http://localhost/`

## Использование

Демо-версия Citeck Community предоставляет предварительно настроенную среду для тестирования и изучения возможностей системы Citeck. Вы можете войти в систему, используя следующие учетные данные:

- Username: `admin`
- Password: `admin`

Обратите внимание, что это демонстрационная версия, и ее не рекомендуется использовать в производственных целях. Если вы хотите использовать Citeck в производственной среде, обратитесь к официальной документации за инструкциями по развертыванию.

## Остановка и удаление контейнеров

Для остановки и удаления контейнеров Docker используйте следующую команду:

```bash
docker-compose down
```

Команда остановит и удалит контейнеры, но загруженные образы останутся в вашей системе. Если вы также хотите удалить образы, то используйте флаг `--volumes`:

```bash
docker-compose down --volumes
```

## Дополнительные ресурсы

Для получения дополнительной информации о Citeck и его функциях обратитесь к официальной документации [Citeck Documentation](https://citeck-ecos.readthedocs.io/ru/latest/index.html)

## Лицензия

Комплект для разворачивания в Docker Compose распространяется под лицензией [LGPL License](LICENSE). Обратите внимание, что у Citeck есть собственные условия лицензирования, с которыми вам следует ознакомиться отдельно.

## Предупреждение

Не загружайте репозиторий в виде архива -  используйте git clone.
