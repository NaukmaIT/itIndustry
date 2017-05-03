package ukma.it.industry.entity;

public class Question {

	private Long id;
	private String questionary;
	private String name;
	
	public Question(){}
	
	public Question(String q, String name){
		questionary = q;
		this.setName(name);
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getQuestionary() {
		return questionary;
	}

	public void setQuestionary(String questionary) {
		this.questionary = questionary;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
