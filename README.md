# Docker_cakePHP3

- ba shコマンド実行
        
        docker exec -it php-book-app-web bash

- bake実行
        
        docker exec -it php-book-app-web bash
        cd app
        
        // MVC 全てのファイル作成 
        bin/cake bake all posts
        

- migration
https://book.cakephp.org/migrations/2/ja/index.html#migrations
https://qiita.com/ozawan/items/8144e02ca70519f3dcaf    参考記事
        
        // マイグレーション適用状況を確認
        bin/cake migrations status
        
        // 現在のDBからマイグレーションファイルを作成 (app/config/Migrations が作成される)
        bin/cake bake migration_snapshot Initial
        
        // テーブル作成 
        bin/cake bake migration CreateProducts         // (簡易版)
        bin/cake migrations create CreateAnswers       // (カスタム定義用)
            // config/Migration/YYYYMMDDHHMMSS_CreateProducts.php が作成される
            // `public $autoId = false;` この記述を書かないと、migrate しても通らない
            // マイグレーション名は以下に従う必要あり
                https://book.cakephp.org/migrations/2/ja/index.html#id6
            // migrationファイルについて (以下のメソッド使う)
                ・up()
                ・down()
                ・change()
        
        // マイグレーション最新まで実行 (以下コマンド実行で`Status Up`になる)
        bin/cake migrations migrate
        
        // 指定したマイグレーションIDまで実行
        bin/cake migrations migrate -t マイグレーションID
        
        // 一つ前にmigrateしたファイルをロールバックする
        bin/cake migrations rollback
        
        // ロールバック (指定したマイグレーションIDまで戻す)
        bin/cake migrations rollback -t マイグレーションID
        
            // テーブルができたか確認
            docker exec -it php-book-app-web bash
            mysql -u root -h 127.0.0.1 -P 13306 -p
            use qa_app;
            show columns from <テーブル名>
            

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
        
        // users
        INSERT INTO users (username, password, nickname, created, modified) values  
        ('noriaki_ito', '4087', 'nori', now(), now()),  
        ('kenta_kato', '4087', 'ken', now(), now()),  
        ('yoko_yamamoto', '4087', 'yop', now(), now());
        
        // questions
        INSERT INTO questions (user_id, body, created, modified) values  
        (1, '最近何かいいことありましたか？', now(), now()),  
        (1, '今日のお昼は何食べましたか？', now(), now()),  
        (1, '興味のある技術は？', now(), now());
        
        // answers
        INSERT INTO answers (user_id, question_id, body, created, modified) values  
        (2, 1, 'お金拾いました', now(), now()),  
        (3, 1, '上司から褒められました', now(), now()),  
        (2, 2, 'お蕎麦を食べました', now(), now());         
