<?php 
require 'config.php';
require 'helpers.php';

$con = mysqli_connect('localhost', 'root', 'root', 'readme');

$post_id = '';
if(!empty($_GET['id'])){
    $post_id = (int)$_GET['id'];  
}

$sql_post = "SELECT p.*, pt.post_type, pt.class_icon, COUNT(DISTINCT l.id) AS likes_count, COUNT(DISTINCT c.id) AS comments_count FROM posts p INNER JOIN post_types pt ON p.post_type = pt.id LEFT JOIN likes l ON l.post_id = p.id LEFT JOIN comments c ON c.post_id = p.id WHERE p.id = {$post_id}";

$result_post = mysqli_query($con, $sql_post);
if ($result_post && (mysqli_num_rows($result_post) > 0 )) :
    $post = mysqli_fetch_assoc($result_post);
    $sql_author = "SELECT u.id, u.login, u.reg_dt, u.avatar_url, COUNT(DISTINCT p.id) AS post_count, COUNT(DISTINCT sb.id) AS sb_count FROM users u LEFT JOIN posts p ON p.user_id = u.id LEFT JOIN subscriptions sb ON sb.user_id = u.id WHERE u.id = {$post['user_id']} GROUP BY u.login";
    $result_author = mysqli_query($con, $sql_author);
    $author = mysqli_fetch_assoc($result_author);

    $white_list_category = ['link', 'photo', 'quote', 'text', 'video'];
    $post_content = '';
    if (in_array($post['post_type'], $white_list_category)) {
        $post_content = include_template("post-{$post['post_type']}.php",[
            'post' => $post
        ]); 
    }

    $page_content = include_template('post-details.php', [
        'post' => $post,
        'post_content' => $post_content,
        'author' => $author
    ]);

    print include_template('layout.php', [
        'is_auth' => rand(0, 1),
        'title_page' => $post['title'], 
        'user_name' => 'Сергей',
        'page_content' => $page_content
    ]);
else :
    http_response_code(404);
endif;