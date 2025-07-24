<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <title>메인 페이지</title>
  <style>
    /* 전체 높이와 flex 컨테이너 설정 */
    html, body {
      height: 100%;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    header, footer {
      background-color: #222;
      color: white;
      padding: 10px 20px;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    header .logo {
      font-size: 24px;
      font-weight: bold;
    }

    header nav a {
      color: white;
      margin-right: 15px;
      text-decoration: none;
      font-weight: 600;
    }

    header nav a:hover {
      text-decoration: underline;
    }

    header .buttons button {
      background-color: transparent;
      color: white;
      border: 1px solid white;
      border-radius: 3px;
      padding: 5px 12px;
      margin-left: 10px;
      cursor: pointer;
      font-weight: 600;
    }

    header .buttons button:hover {
      background-color: white;
      color: #222;
    }

    main {
      flex: 1; /* 남은 공간 모두 차지 */
      display: flex;
      padding: 20px;
      box-sizing: border-box;
    }

    .sidebar {
      width: 200px;
      margin-right: 40px;
    }

    .sidebar h3 {
      margin-top: 0;
    }

    .sidebar ul {
      list-style: none;
      padding-left: 0;
    }

    .sidebar ul li {
      margin-bottom: 8px;
    }

    .sidebar ul li a {
      text-decoration: none;
      color: #1a73e8;
    }

    .sidebar ul li a:hover {
      text-decoration: underline;
    }

    .content {
      flex-grow: 1;
    }

    .content h2 {
      margin-top: 0;
    }

    footer {
      text-align: center;
      font-size: 14px;
    }

    nav.header-nav {
      background-color: #f0f0f0; /* 연한 회색 */
      padding: 8px 20px;
      margin-top: 10px;
      border-radius: 4px;
    }

    nav.header-nav a {
      color: #333;
      margin-right: 20px;
      font-weight: 600;
      text-decoration: none;
    }

    nav.header-nav a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <header>
    <div class="logo">로고</div>
    <div class="buttons">
      <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
          <span style="color:white; font-weight:bold; margin-right: 10px;">
            안녕하세요, ${sessionScope.loginUser.username}님!
          </span>
          <button onclick="location.href='/logout'">로그아웃</button>
        </c:when>
        <c:otherwise>
          <button onclick="location.href='/login/login'">로그인</button>
          <button onclick="location.href='/member/signup'">회원가입</button>
        </c:otherwise>
      </c:choose>
    </div>
  </header>

  <nav class="header-nav">
    <a href="/page/main">메인페이지</a>
    <a href="/gallery">갤러리</a>
    <a href="/restapi/ajax">외부데이터</a>
    <a href="/board">게시판</a>
  </nav>

  <main>
    <aside class="sidebar">
      <h3>사이드바</h3>
      <ul>
        <li><a href="/sidebar/link1">사이드바 링크 1</a></li>
        <li><a href="/sidebar/link2">사이드바 링크 2</a></li>
        <li><a href="/sidebar/link3">사이드바 링크 3</a></li>
      </ul>
    </aside>

    <section class="content">
      <h2>메인 콘텐츠</h2>
      <p>여기에 메인 콘텐츠가 들어갑니다.</p>
    </section>
  </main>

  <footer>
    © 2025 회사명. All rights reserved.
  </footer>
</body>
</html>
