<?php
require 'config.php';
require 'helpers.php';

$con = mysqli_connect('localhost', 'root', 'root', 'readme');

if(!empty($_GET['pt_id'])){
    $pt_id = (int)$_GET['pt_id'];
    $where_sql_posts .= "WHERE p.post_type = {$pt_id}";
}
$sql_posts = "SELECT p.*, u.login, u.avatar_url, pt.post_type, pt.class_icon FROM posts p INNER JOIN users u ON p.user_id = u.id INNER JOIN post_types pt ON p.post_type = pt.id {$where_sql_posts} ORDER BY show_count DESC";
$result_posts = mysqli_query($con, $sql_posts);
$posts = [];
if ($result_posts) { 
    $posts = mysqli_fetch_all($result_posts, MYSQLI_ASSOC);
}

$sql_post_types = 'SELECT * FROM post_types';
$result_post_types =  mysqli_query($con, $sql_post_types);
$post_types = [];
if ($result_post_types) { 
    $post_types = mysqli_fetch_all($result_post_types, MYSQLI_ASSOC);
}

$page_content = include_template('main.php', [
    'posts' => $posts, 
    'post_types' => $post_types
]);

print include_template('layout.php', [
    'is_auth' => rand(0, 1),
    'title_page' => 'Популярные посты', 
    'user_name' => 'Сергей',
    'page_content' => $page_content
]);
