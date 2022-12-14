package admin.dept.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Dept {
	private String adminNo;
	private String deptNum;
	private String name;
	private int depth;
	private String parent_id;
	
	private String memberNo;
	private String memberName;
	private String rank;
	private String memState;
	private String birth;
	private String phone;
	private String address;
	private String email;
	private String leaveTotal;
	private String useLeave;
	private String deptName;
	private String gender;
	
}


