package member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class RegisterForm {
	String username;
	String password;
	String email;
	
	 public boolean isValidPassword() {
	        // 비밀번호가 null이 아니고, 소문자, 대문자, 숫자, 특수문자 모두 포함되어야 함
	        return password != null && password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\W_]).+$");
	    }
}