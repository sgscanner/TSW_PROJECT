package bean;

public class UserBean {
	private String password, username, email;
	private String String;

	public UserBean() {
	}

	public UserBean(String password, String username, String email, String String) {
		this.password = password;
		this.username = username;
		this.email = email;
		this.String = String;
	}

	public String getPassword() {
		return password;
	}

	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getString() {
		return String;
	}

	public void setString(String String) {
		this.String = String;
	}
}
