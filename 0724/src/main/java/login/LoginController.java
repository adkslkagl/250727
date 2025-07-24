package login;

import javax.servlet.http.HttpSession;
import member.Member;
import member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @Autowired
    private MemberMapper memberMapper;

    // 로그인 폼 보여주기
    // http://localhost:9999/login/login
    @GetMapping("login")
    public void login() {
        // 반환 타입이 void일 경우 "/login" → /WEB-INF/views/login.jsp 로 포워딩
    }

    // 로그인 처리
    @PostMapping("/process")
    public String processLogin(String username, String password, HttpSession session) {
        
        Member member = memberMapper.findByUsername(username);

        if (member != null && member.getPassword().equals(password)) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            session.setAttribute("loginUser", member);
            return "redirect:/"; // 메인 페이지로 리디렉트
        } else {
            // 로그인 실패 시 로그인 폼으로 리디렉트
            return "redirect:/login/login?error=true";
        }
    }
}
