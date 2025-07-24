<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>회원가입</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f5f5f5;
    }

    .signup-container {
      width: 500px;
      margin: 50px auto;
      padding: 30px;
      background: white;
      border-radius: 8px;
      box-shadow: 0 0 8px rgba(0,0,0,0.2);
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    td {
      padding: 10px;
    }

    td.label {
      width: 120px;
      text-align: right;
      font-weight: bold;
    }

    input[type="text"], input[type="password"], input[type="email"] {
      width: 100%;
      padding: 8px;
      box-sizing: border-box;
    }

    .confirm-button {
      padding: 8px 12px;
      margin-left: 10px;
    }

    .button-row {
      text-align: center;
      margin-top: 30px;
    }

    .button-row button {
      width: 120px;
      padding: 10px;
      margin: 0 10px;
      border: none;
      font-weight: bold;
      cursor: pointer;
      border-radius: 4px;
    }

    .cancel-btn {
      background-color: white;
      border: 1px solid #333;
    }

    .submit-btn {
      background-color: #444;
      color: white;
    }
  </style>
</head>
<body>

  <div class="signup-container">
    <h2>회원가입 양식</h2>
    <form action="/member/signup" method="post">
      <table>
        <tr>
          <td class="label">이름</td>
          <td><input type="text" name="name" required></td>
        </tr>
        <tr>
          <td class="label">아이디</td>
          <td><input type="text" name="username" required></td>
        </tr>
        <tr>
          <td class="label">비밀번호</td>
          <td><input type="password" name="password" required></td>
        </tr>
        <tr>
          <td class="label">비밀번호 확인</td>
          <td>
            <input type="password" name="passwordConfirm" required>
            <button type="button" class="confirm-button" onclick="checkPasswordMatch()">비밀번호 확인</button>
          </td>
        </tr>
        <tr>
          <td class="label">이메일</td>
          <td><input type="email" name="email" required></td>
        </tr>
      </table>

      <div class="button-row">
        <button type="reset" class="cancel-btn">가입취소</button>
        <button type="submit" class="submit-btn">회원가입</button>
      </div>
    </form>
  </div>

  <script>
    // 비밀번호 확인 버튼 눌렀을 때 비밀번호 일치 확인
    function checkPasswordMatch() {
      const pw = document.querySelector('input[name="password"]').value;
      const pwConfirm = document.querySelector('input[name="passwordConfirm"]').value;
      if (pw === pwConfirm) {
        alert("비밀번호가 일치합니다.");
      } else {
        alert("비밀번호가 일치하지 않습니다.");
      }
    }
  </script>

  <c:if test="${not empty error}">
    <script>
      alert("${error}");
    </script>
  </c:if>


</body>
</html>
