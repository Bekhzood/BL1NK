CREATE TABLE IF NOT EXISTS  barber_timetable (
  "id"          BIGSERIAL PRIMARY KEY,
  "barber_id"   varchar NOT NULL,
  "user_id"     varchar NOT NULL,
  "service"     varchar,
  "date"        varchar NOT NULL,
  "from_time"   varchar NOT NULL,
  "to_time"     varchar NOT NULL,
  "payment"     varchar,
  "status"      boolean DEFAULT true,
  "created_at"  timestamp DEFAULT (now()),
  "updated_at"  timestamp DEFAULT (now())
);