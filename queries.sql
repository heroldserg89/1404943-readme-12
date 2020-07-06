INSERT INTO post_types SET post_type = 'photo', class_icon = 'post-photo';
INSERT INTO post_types SET post_type = 'text', class_icon = 'post-text';
INSERT INTO post_types SET post_type = 'quote', class_icon = 'post-quote';
INSERT INTO post_types SET post_type = 'link', class_icon = 'post-link';
INSERT INTO post_types SET post_type = 'video', class_icon = 'post-video';

INSERT INTO users SET login = 'serg', email = 'serg@mail.ru', PASSWORD = '123456', reg_dt = '2019-01-07 23:12:14', avatar_url = 'http://readme/img/userpic.jpg';
INSERT INTO users SET login = 'herold', email = 'herold@gmail.com', PASSWORD = '654321', reg_dt = '2020-01-07 23:12:14', avatar_url = 'http://readme/img/userpic-mark.jpg';

INSERT INTO posts SET publication_dt = '2020-07-05 06:43:51', title = 'Цитата', content = 'Мы в жизни любим только раз, а после ищем лишь похожих', author_quote = 'Неизвестный Автор
', user_id = '1', post_type = '3'; 
INSERT INTO posts SET publication_dt = '2020-07-04 11:06:51', title = 'Игра престолов', content = 'Не могу дождаться начала финального сезона своего любимого сериала!', user_id = '2', post_type = '2'; 
INSERT INTO posts SET publication_dt = '2020-07-02 07:06:51', title = 'Наконец, обработал фотки!', content = 'http://readme/img/rock-medium.jpg', user_id = '1', post_type = '1'; 
INSERT INTO posts SET publication_dt = '2020-06-28 07:06:51', title = 'Моя мечта', content = 'http://readme/img/coast-medium.jpg', user_id = '2', post_type = '1'; 
INSERT INTO posts SET publication_dt = '2019-08-05 07:06:51', title = 'Лучшие курсы', content = 'www.htmlacademy.ru', user_id = '1', post_type = '4';

INSERT INTO comments SET comment_dt = '2020-07-05 06:43:51', comment_content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et magnis dis parturient montes nascetur ridiculus mus mauris vitae. Volutpat blandit aliquam etiam erat velit scelerisque in dictum. At elementum eu facilisis sed odio. Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus.', user_id = '1', post_id = '2';
INSERT INTO comments SET comment_dt = '2020-07-02 07:06:51', comment_content = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et magnis dis parturient montes nascetur ridiculus mus mauris vitae. Volutpat blandit aliquam etiam erat velit scelerisque in dictum. At elementum eu facilisis sed odio. Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus.', user_id = '2', post_id = '3';

-- Cписок постов с сортировкой по популярности и вместе с именами авторов и типом контента
SELECT p.*, u.login, pt.post_type FROM posts p INNER JOIN users u ON p.user_id = u.id INNER JOIN post_types pt ON p.post_type = pt.id ORDER BY show_count DESC;
-- Cписок постов для конкретного пользователя
SELECT * FROM posts WHERE user_id = '1';
-- Cписок комментариев для одного поста, в комментариях должен быть логин пользователя
SELECT c.*, u.login FROM comments c INNER JOIN users u ON c.user_id = u.id WHERE post_id = 2;
-- Добавление лайка к посту
INSERT INTO likes SET user_id = '1', post_id = '4';
-- Подписка на пользователя
INSERT INTO subscriptions SET subscription = '1', user_id = '2';