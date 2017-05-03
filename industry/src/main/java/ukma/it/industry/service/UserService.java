package ukma.it.industry.service;

import java.sql.SQLException;
import java.util.List;

import ukma.it.industry.entity.User;

public interface UserService {

	public User getUserByEmail(String email);
	
	public User getUserById(long id);
	
	public void create(String email, String name, String surname, String password, String phone_number, String role) throws SQLException;
	
	public void update(User user) throws SQLException;
	
	public void delete(long id) throws SQLException;
	
	public List<User> getUsersByRole();
}
