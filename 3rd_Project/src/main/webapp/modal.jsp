<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"content="Words arranged in a circle and animated clockwise-anticlockwise.">
<meta name="keywords"content="Responsive, Web, HTML, CSS, JavaScript, Animation, Keyframes, CSS Animation">
<meta name="author" content="Abhishek Rawat">
<link rel="stylesheet" href="styles.css">
<title>text</title>
</head>

<style>
.img {animation: rotate_image 15s linear infinite;transform-origin: 50% 50%;}

@keyframes rotate_image{
    100% {
        transform: rotate(360deg);
    }
}
</style>

<body>
<img src="resources/image/background.png" class="img" width="300">
</body>
</html>
