package restapi;

import java.util.List;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

// UserService 클래스 import 꼭 필요
import restapi.UserService;

@RestController
@RequestMapping("/api")
public class UserApiController {

    private UserService userService;

    // 생성자 주입 (Spring이 자동으로 주입해줌)
    public UserApiController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/users")
    public List<User> getUsers() {
        return userService.getAllUsers();
    }
}
