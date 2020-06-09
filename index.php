<?php
require 'config.php';
require 'helpers.php';

$posts = [
    [
        'post_type' => 'post-quote',
        'post_title' => 'Цитата',
        'post_content' => 'Мы в жизни любим только раз, а после ищем лишь похожих',
        'post_author' => 'Лариса',
        'avatar' => 'userpic-larisa-small.jpg'
    ],
    [
        'post_type' => 'post-text',
        'post_title' => 'Игра престолов',
        'post_content' => 'Не могу дождаться начала финального сезона своего любимого сериала!',
        'post_author' => 'Владик',
        'avatar' => 'userpic.jpg'
    ],
    [
        'post_type' => 'post-photo',
        'post_title' => 'Наконец, обработал фотки!',
        'post_content' => 'rock-medium.jpg',
        'post_author' => 'Виктор',
        'avatar' => 'userpic-mark.jpg'
    ],
    [
        'post_type' => 'post-photo',
        'post_title' => 'Моя мечта',
        'post_content' => 'coast-medium.jpg',
        'post_author' => 'Лариса',
        'avatar' => 'userpic-larisa-small.jpg'
    ],
    [
        'post_type' => 'post-link',
        'post_title' => 'Лучшие курсы',
        'post_content' => 'www.htmlacademy.ru',
        'post_author' => 'Владик',
        'avatar' => 'userpic.jpg'
    ]
];


function cropText($text, $length = 300)
{
    if (mb_strlen($text) <= $length) {
        return '<p>' . $text . '</p>';
    } else {
        $text = explode(' ', $text);
        $length_word = 0;
        foreach ($text as $word) {
            $length_word += (mb_strlen($word)) + 1;
            if ($length_word > 300) {
                break;
            } else {
                $text_sup[]= $word; 
            }
        }
        return '<p>' . implode(' ', $text_sup) . '...</p><a class="post-text__more-link" href="#">Читать далее</a>';
    }
}

$page_content = include_template('main.php', [
    'posts' => $posts, 
]);

print include_template('layout.php', [
    'is_auth' => rand(0, 1),
    'title_page' => 'Популярные посты', 
    'user_name' => 'Сергей',
    'page_content' => $page_content
]);
