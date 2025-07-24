<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>User List AJAX Example</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<h1>User List</h1>

<table border="1" id="userTable" style="border-collapse: collapse; width: 100%;">
  <thead>
    <tr>
      <th>id</th>
      <th>name</th>
      <th>username</th>
      <th>email</th>
      <th>phone</th>
      <th>website</th>
      <th>company</th>
      <th>city</th>
    </tr>
  </thead>
  <tbody>
    <!-- 데이터가 여기 채워집니다 -->
  </tbody>
</table>

<script>
$(document).ready(function() {
  $.ajax({
    url: 'http://localhost:9999/restapi/api/users', // API 주소 맞게
    method: 'GET',
    dataType: 'json',
    success: function(data) {
      let tbody = '';
      data.forEach(function(user) {
        tbody += '<tr>';
        tbody += '<td>' + user.id + '</td>';
        tbody += '<td>' + user.name + '</td>';
        tbody += '<td>' + user.username + '</td>';
        tbody += '<td>' + user.email + '</td>';
        tbody += '<td>' + user.phone + '</td>';
        tbody += '<td>' + user.website + '</td>';
        // 중첩 객체는 존재여부 체크 후 출력
        tbody += '<td>' + (user.company ? user.company.name : '') + '</td>';
        tbody += '<td>' + (user.address ? user.address.city : '') + '</td>';
        tbody += '</tr>';
      });
      $('#userTable tbody').html(tbody);
    },
    error: function(xhr, status, error) {
      alert('데이터를 불러오는 중 오류가 발생했습니다.');
      console.error(error);
    }
  });
});
</script>

</body>
</html>
