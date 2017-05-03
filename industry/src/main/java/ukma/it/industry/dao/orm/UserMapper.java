package ukma.it.industry.dao.orm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ukma.it.industry.entity.User;

public class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setId_user(rs.getLong("id"));
		user.setEmail(rs.getString("email"));
		user.setName(rs.getString("name"));
		user.setSurname(rs.getString("surname"));
		user.setPhone_number(rs.getString("phone_number"));
		user.setRole(rs.getString("role"));
		user.setPassword(rs.getString("password"));
		return user;
	}
}
