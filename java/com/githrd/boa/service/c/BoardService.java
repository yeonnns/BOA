package com.githrd.boa.service.c;
/**
 * 	게시글 관련 기능을 부가적으로 처리하는 클래스
 * 
 * 	@author 최이지
 * 	@since 2022.06.22
 * 	@version v.1.0
 * 		작업 이력
 * 			2022.06.22	-	클래스 제작
 * 								담당자 : 최이지
 * 
 * 			2022.06.26	-	함수 추가(uploadProc, addBoard, editBoard)
 * 								담당자 : 최이지
 * 
 * 			2022.06.27	-	함수 추가(getBGnr, setBDetail)
 * 								담당자 : 최이지
 * 
 * 			2022.06.29	-	함수 수정(setBDetail)
 * 								담당자 : 최이지
 * 
 * 			2022.07.15	-	선호 장르 조회를 위한 함수 수정(setBDetail)
 * 								담당자 : 최이지
 *
 */

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.githrd.boa.dao.c.BoardDao;
import com.githrd.boa.util.c.FileUtil;
import com.githrd.boa.vo.c.*;

public class BoardService {

	@Autowired
	BoardDao bDao;
	
// 게시글 리스트 관련 ---------------------------------------------------------------------------

	// 컬렉션 정보 장르 처리
	public void getCGnr(CollecVO cVO){
		List<GenreVO> glist = bDao.getGnr();
		if(cVO.getSgenre().equals("empty")) return;
		
		for(GenreVO gvo : glist) {
			for(int gno : cVO.getGnos()) {
				if(gno == gvo.getGno()) {
					cVO.getGenre().add(gvo.getGname());
				}
			}
		}
	}
	
	// 게시글 리스트 장르 처리
	public void getBListGnr(List<BoardVO> list) {
		List<GenreVO> glist = bDao.getGnr();
		
		for(BoardVO bVO : list) {
			if(bVO.getSgenre().equals("empty")) continue;
			
			for(GenreVO gVO : glist) {
				for(int gno : bVO.getGnos()) {
					if(gno == gVO.getGno()) {
						bVO.getGenre().add(gVO.getGname());
					}
				}
			}
			
		}
	}
	
// 게시글 작성/수정 -----------------------------------------------------------------------------
	
	// 파일 업로드
		public FileVO uploadProc(MultipartFile file) {
			// 반환값 변수
			FileVO fVO = new FileVO();
			String savename = null;	// 저장 이름
			
			// 저장경로 도출
			String path = this.getClass().getResource("").getPath();
			path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources/upload";
			
			// 파일 크기 도출
			long len = file.getSize();
			fVO.setLen(len);
			
			// 파일 이름 만들기
			String oldName = file.getOriginalFilename();
			if(oldName == null) return fVO;	// 넘어온 파일이 없을 때
			fVO.setOriname(oldName);
			savename = FileUtil.rename(path, oldName);
			fVO.setSavename(savename);
			
			// 업로드
			try {
				File f = new File(path, savename);
				file.transferTo(f);	// 파일 정보 기록
			}catch(Exception e) {
				e.printStackTrace();
			}
			return fVO;
		}
		
		// db 입력 : 게시글 작성
		@Transactional
		public int addBoard(BoardVO bVO) {
			// 파일 제외 정보 입력
			String id = bVO.getId();
			bDao.addBoard(bVO);
			bDao.addPoint(id);
			
			// 썸네일 존재시 파일 채워주기
			if(bVO.getThumb() != null) {
				FileVO thumb = uploadProc(bVO.getThumb());
				
				// bno, id 채워주기
				thumb.setBno(bVO.getBno());
				thumb.setId(bVO.getId());
				
				// 입력
				bDao.addThumb(thumb);
			}
			
			return 1;
		}
		
		// db 입력 : 게시글 수정
		@Transactional
		public int editBoard(BoardVO bVO) {
			bDao.editBoard(bVO);
			
			// 파일 변경사항 있는지 확인
			if(bVO.getThumb() != null) {// 새 썸네일 입력됨
				FileVO thumb = uploadProc(bVO.getThumb());
				
				bDao.setOldThumb(bVO.getBno());
				
				// bno, id 채워주기
				thumb.setBno(bVO.getBno());
				thumb.setId(bVO.getId());
				
				bDao.addThumb(thumb);
			}else if(bVO.getFno() != 0) {// 히스토리 중 선택
				bDao.setOldThumb(bVO.getBno());
				bDao.setNewThumb(bVO.getFno());
			}
			
			return 1;
		}
		
// 게시글 상세보기 관련 -------------------------------------------------------------------------
		
	// 단일 게시글 장르 처리
	public void getBGnr(BoardVO bVO) {
		List<GenreVO> glist = bDao.getGnr();
		
		if(bVO.getSgenre().equals("empty")) return;
		
		for(GenreVO gVO : glist) {
			for(int gno : bVO.getGnos()) {
				if(gno == gVO.getGno()) {
					bVO.getGenre().add(gVO.getGname());
				}
			}
		}
	}
	
	// 게시글 상세보기 상세 처리
	public BoardVO setBDetail(BoardVO bVO) {
		// 기본 정보 불러오기
		String id = null;
		if(bVO.getId()!= null) id = bVO.getId();
		bVO = bDao.getBDetail(bVO);
		String cid = bVO.getId();
		
		// 조회수 올리기
		bDao.upClick(bVO.getBno());
		if(id != null && !id.equals(cid)) {
			bVO.setId(id);
			bDao.viewCheck(bVO);
		}
		bVO.setId(cid);
		
		// 장르 처리
		getBGnr(bVO);
		
		// 구매 여부 도출
		String bought = "YES";
		if(bVO.getPrice() != 0) {
			String body = bVO.getBody();
			
			// 로그인 상태가 아닐 시에 미리보기 처리
			if(id == null) {
				bought = "NO";
				bVO.setBought(bought);
				
				if(body.length() > 300) {
					body = body.substring(0, 300);
				}
				bVO.setBody(body.replaceAll("\n", "<br>"));
				return bVO;
			}
			
			// 작성자 본인일 시
			if(id.equals(cid)) {
				bVO.setBody(body.replaceAll("\n", "<br>"));
				return bVO;
			}
			
			bVO.setId(id);
			
			int bcnt = bDao.didBuy(bVO);
			
			// 미구매시 미리보기 처리
			if(bcnt != 1) {
				bought = "NO";
				
				if(body.length() > 300) {
					body = body.substring(0, 300);
				}
			}
			
			bVO.setBody(body.replaceAll("\n", "<br>"));
			bVO.setBought(bought);
			
		}else {
			// 무료글
			bVO.setBody(bVO.getBody().replaceAll("\n", "<br>"));
		}
		
		// 좋아요/찜 여부 처리
		bVO.setId(id);
		if(id == null) return bVO;
		String nowStat = bDao.getStat(bVO);
		if(nowStat != null) bVO.setNowStat(nowStat);
		bVO.setId(cid);
		
		return bVO;
	}
}
