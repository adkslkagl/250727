package login;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import member.Member;
import member.MemberMapper;


@Service
public class LoginService implements UserDetailsService{

	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	public LoginService() {
		System.out.println("로그인 서비스 생성자 생성!!");
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    System.out.println("로그인 폼으로부터 전달된 username: " + username);
	    SqlSession sqlSession = sqlSessionFactory.openSession();
	    MemberMapper memberDao = sqlSession.getMapper(MemberMapper.class);
	    Member member = memberDao.findByUsername(username);
	    System.out.println(member);

	    if (member == null) {
	        throw new UsernameNotFoundException("User not found");
	    }

	    // 권한을 단일 ROLE_USER로 고정
	    List<GrantedAuthority> authorities = new ArrayList<>();
	    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

	    // DB에 저장된 암호는 이미 BCrypt로 암호화 되어 있다고 가정
	    User user = new User(member.getUsername(), member.getPassword(), authorities);

	    System.out.println(user);
	    return user;
	}



}