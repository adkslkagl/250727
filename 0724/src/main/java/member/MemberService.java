package member;

import java.util.Date;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    MemberMapper dao;
    
    public void save(RegisterForm form) {
        // 전달받은 폼 데이터를 Member 객체로 복사
        Member member = new Member();
        BeanUtils.copyProperties(form, member);
        
        
        
        // 회원 정보 저장
        dao.save(member);
    }
    
    public boolean isUsernameAvailable(String username) {
        return dao.findByUsername(username) == null;
    }
}
