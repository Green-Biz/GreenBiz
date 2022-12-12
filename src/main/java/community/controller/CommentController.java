package community.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.dto.Comment;
import community.service.face.CmtService;
import community.util.CmtPaging;

@Controller
@RequestMapping("/community/cmt")
public class CommentController {


	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired CmtService cmtService;

	//댓글작성
	@ResponseBody
	@PostMapping({"/",""})
	public String cmtWrite(Comment comment, HttpSession session) {
		logger.info("댓글 작성 실행 확인");

		//로그인
		comment.setMemberno((String)session.getAttribute("loginId")); 

		logger.info("댓글 : {}", comment);

		cmtService.cmtWrite(comment);

		return "success";

	}
	

	
	//댓글 갯수
	@ResponseBody
	@GetMapping("/cCount")
	public int cCount(@RequestParam int cno, Model model) {
		logger.info("cCount 실행");
		
		int total = cmtService.getTotal(cno);
		logger.info("총 댓글 갯수 : {}", total);
		
		return total;
	}
	


	//댓글 목록
	@RequestMapping(value="cmtList", method = RequestMethod.GET)
	public ModelAndView CmtList(@RequestParam int cno, 
			@RequestParam(defaultValue="1") int curPage,
			ModelAndView mav, HttpSession session) {
		
		logger.info("댓글 리스트 가져오기");

		//페이징 처리
		int count = cmtService.getTotal(cno); //댓글수
		CmtPaging cmtPaging = new CmtPaging(count, curPage);

		//현재 페이지 페이징 시작 번호
		int start = cmtPaging.getPageBegin();

		//현재 페이지의 페이징 끝 번호
		int end = cmtPaging.getPageEnd();
		List<Comment> list = cmtService.list(cno, start, end, session);
		
		//뷰이름 지정
		mav.setViewName("/community/cmtList");
		
		//뷰에 전달할 데이터 지정
		mav.addObject("list", list);
		mav.addObject("cmtPaging", cmtPaging);
		

		return mav;


	}
	
//	//댓글 목록 조회
//	// http method: get
//	// url : /community
//	@GetMapping("/cmtList")
//	@ResponseBody
//	public Map<String, Object> cmtList(@RequestParam int cno) {
//		Map<String, Object> resultMap = new HashMap<>();
//			
//		try {
//			List<Comment> list = cmtService.list(cno);
//			resultMap.put("list", list);
//			resultMap.put("result", true);
//		
//		}catch(Exception e) {
//			e.printStackTrace();
//			resultMap.put("result", false);
//		}
//		
//		return resultMap;
//	}

	//댓글 수정
	@RequestMapping(value="/cmtUpdate/{cono}",method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> cmtUpdate(@PathVariable("cono") int cono, @RequestBody Comment comment) {

		ResponseEntity<String> entity = null;
		try {
			comment.setCono(cono);
			cmtService.update(comment);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;

	}
	
	//댓글 삭제
	@RequestMapping(value="/cmtDelete/{cono}")
	public ResponseEntity<String> cmtDelete(@PathVariable("cono") int cono) {
		 ResponseEntity<String> entity = null;
	        
	        try {
	            cmtService.delete(cono);
	            
	            entity = new ResponseEntity<String>("success", HttpStatus.OK);
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            
	            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	        }
	        
	        return entity;
	    }
}