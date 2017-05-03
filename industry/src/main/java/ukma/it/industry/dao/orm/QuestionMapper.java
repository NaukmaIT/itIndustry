package ukma.it.industry.dao.orm;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import ukma.it.industry.entity.Question;
import ukma.it.industry.entity.User;

public class QuestionMapper implements RowMapper<Question>{

	@Override
	public Question mapRow(ResultSet rs, int rowNum) throws SQLException {
		Question question = new Question();
		question.setId(rs.getLong("id"));
		question.setQuestionary(rs.getString("questionary"));
		question.setName(rs.getString("name"));
		return question;
	}
}
