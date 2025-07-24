package page;  // root-context.xml에 맞게 패키지명 맞춰주세요

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String main() {
        return "mainpage";  // /WEB-INF/views/page/main.jsp 를 의미
    }
}

