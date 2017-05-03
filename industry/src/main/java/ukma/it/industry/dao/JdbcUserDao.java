package ukma.it.industry.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ukma.it.industry.dao.orm.QuestionMapper;
import ukma.it.industry.dao.orm.UserMapper;
import ukma.it.industry.entity.Question;
import ukma.it.industry.entity.User;

@Repository
public class JdbcUserDao implements UserDao{
	
	private static final String SQL_INSERT_USER = "INSERT INTO player(email, name, surname, password, phone_number, role) VALUES (?, ?, ?, ?, ?, ?)";

	private static final String SQL_GET_USER_BY_EMAIL = "SELECT * FROM player WHERE email = ?";
	
	private static final String SQL_GET_ALL_QUESTIONS = "SELECT * FROM question";
	
	private static final String SQL_INSERT_QUESTION = "INSERT INTO question(questionary,name) VALUES(?,?)";
	
	private static final String SQL_GET_USERS_BY_ROLE = "SELECT * FROM player WHERE role = 'student'";
	
	private static final String SQL_GET_USER_BY_ID = "SELECT * FROM player WHERE id = ?";
	
	private static final String SQL_UPDATE_USER = "UPDATE player SET name = ?, surname = ?, password = ?, phone_number = ? WHERE id = ?";
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public User getUserByEmail(String email) {
		return jdbcTemplate.queryForObject(SQL_GET_USER_BY_EMAIL, new UserMapper(), email);
	}
	
	@Override
	public User getUserById(long id){
		return jdbcTemplate.queryForObject(SQL_GET_USER_BY_ID, new UserMapper(), id);
	}

	@Override
	public void create(User user) throws SQLException {
		
		PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQL_INSERT_USER);
		ps.setString(1, user.getEmail());
		ps.setString(2, user.getName());
		ps.setString(3, user.getSurname());
		ps.setString(4, user.getPassword());
		ps.setString(5, user.getPhone_number());
		ps.setString(6, user.getRole());
		ps.executeUpdate();
		ps.close();
	}

	@Override
	public void update(User user) throws SQLException {
		
		PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQL_UPDATE_USER);
		ps.setString(1, user.getName());
		ps.setString(2, user.getSurname());
		ps.setString(3, user.getPassword());
		ps.setString(4, user.getPhone_number());
		ps.setLong(5, user.getId_user());
		
		ps.executeUpdate();
		ps.close();
	}

	@Override
	public void delete(long id) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getUsersByRole() {
		return jdbcTemplate.query(SQL_GET_USERS_BY_ROLE, new UserMapper());
	}

	@Override
	public List<Question> getAllQuestions() {
		return jdbcTemplate.query(SQL_GET_ALL_QUESTIONS, new QuestionMapper());
	}

	@Override
	public void create(Question question) throws SQLException {
		PreparedStatement ps = jdbcTemplate.getDataSource().getConnection().prepareStatement(SQL_INSERT_QUESTION);
		ps.setString(1, question.getQuestionary());
		ps.setString(2, question.getName());
		
		ps.executeUpdate();
		ps.close();
	}

}
