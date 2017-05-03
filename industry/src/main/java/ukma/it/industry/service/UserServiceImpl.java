package ukma.it.industry.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ukma.it.industry.dao.UserDao;
import ukma.it.industry.entity.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	
	@Override
	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}
	
	@Override
	public User getUserById(long id){
		return userDao.getUserById(id);
	}

	@Override
	public void create(String email, String name, String surname, String password, String phone_number, String role) throws SQLException {
		User user = new User(name, surname, phone_number, role, email, password);
		userDao.create(user);
	}

	@Override
	public void update(User user) throws SQLException {
		userDao.update(user);
	}

	@Override
	public void delete(long id) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getUsersByRole() {
		return userDao.getUsersByRole();
	}

}
