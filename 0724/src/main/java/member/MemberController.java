package member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;




@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("signup")
	public void getRegister() {} //WEB-INF/views/member/register.jsp
	
	@PostMapping("signup")
	public String register(RegisterForm form, Model model) {
	    // 아이디 중복 체크
	    if (!service.isUsernameAvailable(form.getUsername())) {
	        model.addAttribute("error", "이미 사용 중인 아이디입니다.");
	        return "signup"; // 다시 회원가입 폼으로
	    }
	    
	    if (!form.isValidPassword()) {
	        model.addAttribute("error", "비밀번호는 영문 대소문자, 숫자, 특수문자를 모두 포함해야 합니다.");
	        return "signup";  
	    }

	    // 저장 및 리다이렉트
	    service.save(form);
	    return "redirect:/login/login";
	}
}