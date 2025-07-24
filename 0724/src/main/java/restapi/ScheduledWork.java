package restapi;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import restapi.User;
import restapi.UserMapper;

import java.net.URL;
import java.util.List;

@Component
public class ScheduledWork {

    @Autowired
    private UserMapper userMapper;  // MemberMapper → UserMapper

    private int count = 1;

    @Scheduled(fixedRate = 10000) // 10초마다 실행
    public void syncUsers() {
        System.out.println("⏰ [Scheduled] 실행 횟수: " + count++);
        try {
            String address = "http://172.16.15.77:9999/restapi/api/users";  // API 주소도 맞게
            URL url = new URL(address);

            ObjectMapper mapper = new ObjectMapper();
            List<User> users = mapper.readValue(url, new TypeReference<List<User>>() {});
            System.out.println("✔ 가져온 User 수: " + users.size());

            for (User u : users) {
                System.out.println("→ 저장: " + u);
                userMapper.insertUser(u); // UserMapper에 맞게 insertUser 메서드 작성 필요
            }

        } catch (Exception e) {
            System.out.println("❌ 에러 발생: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
