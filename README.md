# Docker_cakePHP3

- bashコマンド実行
        
        docker exec -it php-book-app-web bash

- mysql実行コマンド(password: secret)   

        mysql -u root -h 127.0.0.1 -P 13306 -p

- お試し投入データ  
        
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
