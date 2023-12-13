<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/adminMenu.css">
  <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/styles.css">

    <title>SideBar sub menus</title>
</head>
<body id="body-pd">
    <div class="l-navbar" id="navbar">
        <nav class="nav">
            <div>
                <div class="nav__brand">
                    <ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
                    <a href=".main" class="nav__logo">Hidden Beauty</a>
                </div>
                <div class="nav__list">

                    <div href="#" class="nav__link collapse">
                        <ion-icon name="people-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">&nbsp;고객</span>
                    </div>
                    
                    <a href="#" class="nav__link">
                    	<ion-icon name="cart-outline"></ion-icon>
						<span class="nav_name">&nbsp;화장품</span>
                    </a>
                    
                    <a href="#" class="nav__link">
                    	<ion-icon name="location-outline"></ion-icon>
						<span class="nav_name">&nbsp;진단 회사</span>
                    </a>
                    
                    <a href="adminCelebList.admin" class="nav__link">
                    	<ion-icon name="camera-outline"></ion-icon>
						<span class="nav_name">&nbsp;연예인</span>
                    </a>
                    
					<a href="adminCboardList.admin" class="nav__link">
                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
                        <span class="nav_name">&nbsp;후기 게시판</span>
                    </a>
                    
                    <a href="adminQboardList.admin" class="nav__link">
                        <ion-icon name="help-outline"></ion-icon>
                        <span class="nav_name">&nbsp;문의 게시판</span>
                    </a>

                    
                </div>
                <a href="logout.u" class="nav__link">
                    <ion-icon name="log-out-outline" class="nav__icon"></ion-icon>
                    <span class="nav_name">&nbsp;로그아웃</span>
                </a>
            </div>
        </nav>
    </div>
    <!-- IONICONS -->
    <script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
    <!-- JS -->
    <script src="<%= request.getContextPath() %>/resources/js/adminMenu.js"></script>
</body>
</html>