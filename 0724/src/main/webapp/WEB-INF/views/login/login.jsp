<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-box {
      background-color: white;
      border: 1px solid #ccc;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
      width: 350px;
    }

    .input-group {
      display: flex;
      flex-direction: column;
      gap: 10px;
      margin-bottom: 20px;
    }

    input[type="text"], input[type="password"] {
      padding: 12px;
      font-size: 14px;
      border: 1px solid #ddd;
      background-color: #f0f0f0;
      border-radius: 4px;
    }

    .login-row {
      display: flex;
      gap: 10px;
    }

    .login-row .inputs {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 10px;
    }

    .login-btn {
      background-color: #d88d00;
      color: white;
      border: none;
      padding: 26px 18px;
      border-radius: 4px;
      font-weight: bold;
      cursor: pointer;
      font-size: 14px;
      transition: background-color 0.3s ease;
    }

    .login-btn:hover {
      background-color: #c77c00;
    }
  </style>
</head>
<body>
  <form action="/login/process" method="post">
    <div class="login-box">
      <div class="login-row">
        <div class="inputs">
          <input type="text" name="username" placeholder="아이디" required>
          <input type="password" name="password" placeholder="비밀번호" required>
        </div>
        <button type="submit" class="login-btn">로그인</button>
      </div>
    </div>
  </form>
</body>
</html>
