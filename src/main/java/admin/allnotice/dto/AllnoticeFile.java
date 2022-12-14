package admin.allnotice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AllnoticeFile {
	private int nFileNo;
	private int allnoticeNo;
	private String originName;
	private String storedName;
	private int fileSize;
}
