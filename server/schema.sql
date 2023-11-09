CREATE DATABASE app_todo;
USE app_todo;
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255)
);
CREATE TABLE todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  completed BOOLEAN DEFAULT false,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
CREATE TABLE shared_todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  todo_id INT,
  user_id INT,
  shared_with_id INT,
  FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);
INSERT INTO users (name, email, password)
VALUES ('John Doe', 'nicoposa@gmail.com', '123456');
INSERT INTO users (name, email, password)
VALUES ('Nicolás Posa', 'nicoposa1@gmail.com', '123456');
INSERT INTO todos (title, user_id)
VALUES ('Buy milk', 1),
  ('Buy bread', 1),
  ('Buy eggs', 1),
  ('Buy milk', 2),
  ('Buy bread', 2),
  ('Buy eggs', 2);
INSERT INTO shared_todos (todo_id, user_id, shared_with_id)
VALUES(1, 1, 2)