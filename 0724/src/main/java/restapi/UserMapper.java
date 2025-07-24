package restapi;

import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface UserMapper {
    void insertUser(User user);

    // 👇 추가해야 하는 메서드
    List<User> selectAllUsers();
}
