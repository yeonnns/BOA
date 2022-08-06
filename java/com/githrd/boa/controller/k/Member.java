package com.githrd.boa.controller.k;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.boa.dao.k.MemberDao;
import com.githrd.boa.service.k.MailsendService;
import com.githrd.boa.service.k.MemberService;
import com.githrd.boa.vo.k.FileVO;
import com.githrd.boa.vo.k.MemberVO;
/**
 *  member 관련 요청을 처리할 controller 클래스
 * @author	김소연
 * @since	2022.06.13
 * @version	v.1.0
 * 
 * 			작업이력 ]
 * 				2022.06.13	-	담당자 : 김소연
 * 									클래스 제작, 
 * 									로그인 화면보기 , 로그인 요청 처리, 로그아웃
 * 				2022.06.15 	-		회원가입 화면보기, id, mail, pw 체크 
 * 				2022.06.16	-		id/pw 찾기 
 * 				2022.06.18  -		탈퇴 페이지	처리
 * 				2022.06.21 	-		탈퇴처리
 * 				2022.06.23 	-		회원가입
 * 				2022.06.26 	- 		회원정보 수정
 * 				2022.07.16	-		이메일 인증
 * 				2022.07.19  - 		탈퇴 본인 인증
 * 				2022.07.19  - 		비밀번호 문자 인증
 * 				2022.07.21 - 		휴면 확인, 해제
 * 				
 *  *
 */

@Controller
@RequestMapping("/member")
public class Member {

	 
	@Autowired
	MemberDao mDao;
	@Autowired
	MemberService mSrvc;
	@Autowired
	private MailsendService mailSrvc;
	
	@RequestMapping("/login.boa")
	public ModelAndView loginForm(ModelAndView mv, HttpSession session) {
		mv.setViewName("k/login");
		return mv;
	}

	// 휴면 확인
	@RequestMapping("/humeonCk.boa")
	@ResponseBody
	public Map<String, String> humanCk(MemberVO mVO){
		HashMap<String, String>map = new HashMap<String, String>();
		String result = "XX";
		int cnt = mDao.getMemb(mVO);
		String isshow = mDao.gethumeon(mVO);
		if(cnt == 1) { 
			if(isshow.equals("Y") || isshow.equals("A") ) {
				result = "OK";
			}else {
				result = "NO";
			}
		} 
		map.put("result", result);
		
		return map;
	}
	
	// 휴면 해제
	@RequestMapping("/huClear.boa")
	@ResponseBody
	public Map<String, String> huClear(MemberVO mVO){
		HashMap<String, String>map = new HashMap<String, String>();
			String result = "NO";
			int cnt = mDao.humeonClear(mVO);
			mVO.setCnt(cnt);
			if(cnt == 1) {
				result = "OK";
			} 	
			map.put("result", result);
			return map;
	}
	
	@RequestMapping("/loginProc.boa")
	public ModelAndView loginProc(MemberVO mVO, HttpSession session, ModelAndView mv, RedirectView rv, String vw, String nowPage) {
		int cnt = mDao.getLogin(mVO);
		mVO.setCnt(cnt);
		String view = "/boa/main.boa";
	
		if(vw != null) {
			 view = vw;
		}
		if(cnt == 1) {
			session.setAttribute("SID", mVO.getId());
			if(mVO.getId() != null) {
				mDao.updateLo(mVO);
			}
		} else {
			 view = "/boa/member/login.boa";
		}
		mv.setViewName(view);
		mv.addObject("VIEW", view);
		mv.addObject("NOWPAGE", nowPage);
		
		mv.setViewName("k/redirect");
			return mv;
	}	
	
	
	
	@RequestMapping("/join.boa")
	public ModelAndView join(ModelAndView mv) {
		mv.setViewName("k/join");
		return mv;
	}

	@RequestMapping("/joinProc.boa")
	public ModelAndView joinProc(ModelAndView mv,HttpSession session, MemberVO mVO, String vw, String nowPage) {
		String view = "/boa/main.boa";
		try {
			mSrvc.addMemberData(mVO);
			if(vw != null) {
				 view = vw;
			}else {
				view = "/boa/main.boa";
			}
			
			if(nowPage != null) {
				mv.addObject("NOWPAGE", nowPage);
			}
			session.setAttribute("SID", mVO.getId());
			mVO.setResult("OK");
			
		} catch(Exception e) {
			view = "/boa/member/join.boa";
			e.printStackTrace();
		}
		mv.addObject("VIEW", view);
		mv.setViewName("k/redirect");
		return mv;	
	}
	

	@RequestMapping("/logout.boa")
	public ModelAndView logout(ModelAndView mv, HttpSession session, MemberVO mVO, String vw, String nowPage) {
		session.removeAttribute("SID");
		mVO.setResult("OK");
		String view = "/boa/main.boa";
		if(vw != null) {
			view = vw;
		}
		if(nowPage != null) {
			mv.addObject("NOWPAGE", nowPage);
		}
		
		
		mv.addObject("VIEW", view);
		mv.setViewName("k/redirect");
		return mv;
	}

	// 회원가입정보 중복 체크(id, mail, tel)
	
	@RequestMapping(path="/idCheck.boa", 
			method=RequestMethod.POST, params="id")
	@ResponseBody
	public Map<String, String> idCheck(String id) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getIdCnt(id);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
		}
	
	@RequestMapping(path="/mailCheck.boa", 
			method=RequestMethod.POST, params="email")
	
	@ResponseBody
	public Map<String, String> mailCheck(String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getmailCnt(email);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
		}
	
	@RequestMapping(path="/telCheck.boa", 
			method=RequestMethod.POST, params="tel")
	@ResponseBody
	public Map<String, String> telCheck(String tel) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.gettelCnt(tel);
		
		if(cnt == 0) {
			result = "OK";
		}
		
		map.put("result", result);
		return map;
		}
	
	// idPw 찾기 
	@RequestMapping("/idpwSearch.boa")
	public ModelAndView idpwSearch(ModelAndView mv) {
		mv.setViewName("k/idpwSearch");

		return mv;
	}
	
	// id 찾기 
	@RequestMapping(path="/idSearchProc.boa", 
			method=RequestMethod.POST, params= {"name", "tel"})
	@ResponseBody
	public Map<String, String> idSearch(MemberVO mVO) {
	HashMap<String, String> map = new HashMap<String, String>();
	String result = "NO";
	
	String sid = mDao.getSearchId(mVO);
		if(sid != null) {
			result= "OK";
		}
		map.put("result", result);
		map.put("id", sid);
	
		return map;
	}
	
	// pw 찾기 
	@RequestMapping("/pwSearchProc.boa")
	@ResponseBody
	public Map<String, String> pwSearch(MemberVO mVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getSearchPw(mVO);
		if(cnt == 1) {
			result= "OK";
		}
		map.put("result", result);
		
		return map;
	}
	
	// pw 변경 
	@RequestMapping("/updatePw.boa")
	@ResponseBody
	public Map<String, String> updatePw(MemberVO mVO) {
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.updatePw(mVO);
		mVO.setCnt(cnt);
		if(cnt == 1) {
			result= "OK";
		}
		map.put("result", result);
		
		return map;
	}
	
	
	@RequestMapping(path="/telCheck.boa", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(String tel) {
		//난수 생성
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);

		mailSrvc.certifiedPhoneNumber(tel,randomNumber);
		
		return Integer.toString(randomNumber);
	}
	
	
	
	
	
	// 회원정보 수정 페이지
	@RequestMapping("/editInfo.boa")
	public ModelAndView editinfo(ModelAndView mv, HttpSession session,RedirectView rv, MemberVO mVO) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/boa/member/login.boa");
			mv.setView(rv);
			return mv;
		}

		mVO = mDao.getIdInfo(sid);
		List<FileVO> list = mDao.getIdImg(sid);
		mv.addObject("DATA", mVO);
		mv.addObject("LIST", list);

		mv.setViewName("k/editInfo");
		return mv;
	}
	
	// 프로필 이미지 삭제
	@RequestMapping(path="/delImg.boa", method=RequestMethod.POST, params="fno")
	@ResponseBody
	public HashMap<String, String> delImg(FileVO fVO){
		HashMap<String, String> map = new HashMap<String, String>();
		String result = "NO";
		
		int cnt = mDao.getDelImg(fVO.getFno());
		if(cnt == 1) {
			result = "OK";			
		}
		map.put("result", result);
		return map;
	}
	

	
	// 회원정보 수정 페이지
	@RequestMapping("/editProc.boa")
	public ModelAndView editProc(ModelAndView mv, HttpSession session, MemberVO mVO) {
		String view = "/boa/member/editInfo.boa";
		try {
			mSrvc.editMemberData(mVO);
			mVO.setResult("OK");
		} catch(Exception e) {
			
			e.printStackTrace();
		}
	
		mv.addObject("VIEW", view);
		mv.setViewName("k/redirect");
		return mv;
	}
	
	
	// 탈퇴 
	
	@RequestMapping("/delMember.boa")
	public ModelAndView delMember(ModelAndView mv, HttpSession session,RedirectView rv) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/boa/member/login.boa");
			mv.setView(rv);
			return mv;
		}
		mv.setViewName("k/delMember");
		return mv;
		
	}
	
	@RequestMapping(path="/delMemberProc.boa")
	public ModelAndView delProc(ModelAndView mv,  RedirectView rv, HttpSession session, MemberVO mVO) {
		String sid = (String) session.getAttribute("SID");
		if(sid == null) {
			rv.setUrl("/boa/member/login.boa");
			mv.setView(rv);
			return mv;
		}
		 
		int cnt = mDao.getDelMember(mVO);
		mVO.setCnt(cnt);
		if(cnt == 1) {
			// 세션에 기억한 데이터 삭제
			session.removeAttribute("SID");
			rv.setUrl("/boa/main.boa");	
		} else {
			rv.setUrl("/boa/member/delMember.boa");	
		}
		mv.setView(rv);
		return mv;
	}
	
	
	@RequestMapping("/pwCk.boa")
	@ResponseBody
	public Map<String, String> pwCk (MemberVO mVO){
		HashMap<String, String> map = new HashMap<String, String>();
		String ck = "NO";
		int cnt = mDao.getLogin(mVO);
		if(cnt == 1) {
			ck = "OK";
		}
		map.put("ck", ck);
		return map;
	}
	
	// 휴면해제
	@RequestMapping(value="/certi.boa", method= RequestMethod.GET)
	@ResponseBody
	public String certi(String email) {
	return mailSrvc.humeonEmail(email);
	}
	
	// 회원가입시
	@RequestMapping(value="/joincerti.boa", method= RequestMethod.GET)
	@ResponseBody
	public String joincerti(String email) {
	return mailSrvc.joinEmail(email);
	}
}