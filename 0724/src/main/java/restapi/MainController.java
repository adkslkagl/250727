package restapi;  // XML의 base-package와 동일하게

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
    
 
    @GetMapping("/ajax")
    public String ajax() {
        return "ajax";   // /WEB-INF/views/restapi/ajax.jsp 찾음
    }
}
