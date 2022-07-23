package com.githrd.boa.scheduler.p;

import java.util.List;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.githrd.boa.dao.p.MyInfoDao;
import com.githrd.boa.vo.p.MyInfoVO;

public class AutoPoint {

	@Autowired
	MyInfoDao iDao;
	
	private static final Logger myInfoLog = LoggerFactory.getLogger("myInfoLog");
	
	public void autoPoint() {
		List<MyInfoVO> list = iDao.selAuto();
		
		if(list.size() > 0) {
			
			for(MyInfoVO iVO : list) {
				int cnt = iDao.autoPayment(iVO);
				if(cnt == 1) {
					myInfoLog.info(iVO.getId() + " 회원 님 " + iVO.getGnp() + " 포인트 자동 충전 완료되었습니다.");
				}
			}
		}
	}
}
