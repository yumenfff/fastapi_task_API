# fastapi_task_API

Небольшой учебный API на **FastAPI** для работы со списком задач (ToDo): добавление задач и получение списка

## Что умеет

- `POST /tasks` - добавить задачу (`name`, `description`)
- `GET /tasks` - получить все задачи

## Технологии

- Python
- FastAPI
- SQLAlchemy (async)
- SQLite (`tasks.db`)
- Uvicorn
- Docker

## Структура проекта

- `main.py` - создание приложения FastAPI, lifecycle (`lifespan`)
- `router.py` - HTTP-роуты `/tasks`
- `repository.py` - слой доступа к данным (`TaskRepository`)
- `database.py` - подключение к БД, ORM-модель `TaskOrm`, создание/удаление таблиц
- `schemas.py` - Pydantic-схемы (`STaskAdd`, `STask`, `STaskId`)
- `requirements.txt` - зависимости для pip
- `Dockerfile` - контейнеризация

## Локальный запуск

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn main:app --reload
```

После запуска API доступен по адресу:

- `http://127.0.0.1:8000`
- Swagger UI: `http://127.0.0.1:8000/docs`

## Запуск в Docker

```bash
docker build -t fastapi-tasks .
docker run --rm -p 8000:80 fastapi-tasks
```

После запуска в контейнере API доступен на:

- `http://127.0.0.1:8000`
- Swagger UI: `http://127.0.0.1:8000/docs`

## Примеры запросов

### Добавить задачу

> В текущей реализации параметры передаются как query-параметры

```bash
curl -X POST "http://127.0.0.1:8000/tasks?name=Buy%20milk&description=2%20liters"
```

Пример ответа:

```json
{
  "ok": true,
  "task_id": 1
}
```

### Получить список задач

```bash
curl "http://127.0.0.1:8000/tasks"
```

Пример ответа:

```json
[
  {
    "name": "Buy milk",
    "description": "2 liters",
    "id": 1
  }
]
```
