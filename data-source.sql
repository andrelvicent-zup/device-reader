-- create device table
CREATE TABLE
  tb_device(
    id SERIAL PRIMARY KEY,
    name VARCHAR (50) UNIQUE NOT NULL,
    active BOOLEAN NOT NULL DEFAULT 't',
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP
  );

-- create message table
CREATE TABLE
  tb_message(
    id SERIAL PRIMARY KEY,
    device_id INT NOT NULL,
    data jsonb NOT NULL DEFAULT '{}' ::jsonb,
    is_synced_remotely BOOLEAN NOT NULL DEFAULT 't',
    active BOOLEAN NOT NULL DEFAULT 't',
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    deleted_at TIMESTAMP,
    FOREIGN KEY (device_id) REFERENCES tb_device (id)
  );

-- insert into device table
INSERT INTO
  tb_device
VALUES
  (
    DEFAULT,
    'Arduino Serial Port',
    true,
    now(),
    now(),
    null
  );

-- insert into message table
INSERT INTO
  tb_message
VALUES
  (
    DEFAULT,
    1,
    '{ "data":[ {"type": "temp", "data": "001001"} , {"type": "hum", "data": "002002"} ] }',
    true,
    true,
    now(),
    now(),
    null
  );