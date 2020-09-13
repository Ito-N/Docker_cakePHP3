CREATE DATABASE qa_app;

use qa_app;

create table posts (
    id int unsigned auto_increment primary key,
    title varchar(255),
    body text,
    created datetime default null,
    modified datetime default null
);

INSERT INTO posts (title, body, created) values
('title 1', 'body 1', now()),
('title 2', 'body 2', now()),
('title 3', 'body 3', now());
