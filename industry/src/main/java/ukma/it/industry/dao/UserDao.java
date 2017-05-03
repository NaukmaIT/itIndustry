package ukma.it.industry.dao;

import java.sql.SQLException;
import java.util.List;

import ukma.it.industry.entity.User;

public interface UserDao {

	/**
	 * @return current user
	 * */
	public User getUserByEmail(String email);
	
	/**
	 * @return user by id
	 * */
	public User getUserById(long id);
	
	/**
	 * @category create new user
	 * */
	public void create(User user) throws SQLException;
	
	/**
	 * @category update user
	 * */
	public void update(User user) throws SQLException;
	
	/**
	 * @category delete user
	 * */
	public void delete(long id) throws SQLException;

	public List<User> getUsersByRole();
	
}
