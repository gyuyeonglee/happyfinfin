/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2023 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2023 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.sn.ecommerce5th.moon
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: BuySrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20231208161211][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package kr.co.himedia.ecommerce.front.buy.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.himedia.ecommerce.common.dto.PagingDto;
import kr.co.himedia.ecommerce.common.dto.PagingListDto;
import kr.co.himedia.ecommerce.front.buy.dao.BuyDao;
import kr.co.himedia.ecommerce.front.buy.dao.PayDao;
import kr.co.himedia.ecommerce.front.buy.dto.BuyDtlDto;
import kr.co.himedia.ecommerce.front.buy.dto.BuyMstDto;
import kr.co.himedia.ecommerce.front.buy.dto.PayDto;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2023-12-08
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.himedia.ecommerce.front.buy.service.BuySrvc")
public class BuySrvc {
	
	@Inject
	BuyDao buyDao;
	
	@Inject
	PayDao payDao;
	
	@Transactional("txFront")
	public boolean update(String deal_num, int updater, String flg_success) {
		
		int result = 0;
		
		PayDto payDto = new PayDto();
		payDto.setDeal_num(deal_num);
		payDto.setFlg_success(flg_success);		// 성공(Y), 실패(N)
		result += payDao.update(payDto);
		
		payDto = payDao.select(payDto);
		BuyMstDto buyMstDto = new BuyMstDto();
		buyMstDto.setSeq_buy_mst(payDto.getSeq_buy_mst());
		buyMstDto.setCd_state_pay(flg_success);	// 결제 완료(Y), 결제 전(N), 결제 취소(C)
		result += buyDao.update(buyMstDto);
		
		if (result == 2) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public List<BuyDtlDto> select(BuyMstDto buyMstDto) {
		return buyDao.select(buyMstDto);
	}
	
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = buyDao.count(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(0);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(buyDao.list(pagingDto));
		
		return pagingListDto;
	}

	/*
	@Transactional("txFront")
	public boolean insert(BuyMstDto buyMstDto, BuyDtlDto buyDtlDto, String deal_num) {
		
		int result = 0;
		
		buyMstDto.setSeq_buy_mst(buyDao.sequenceMaster());
		result += buyDao.insertMaster(buyMstDto);
		
		buyDtlDto.setSeq_buy_dtl(buyDao.sequenceDetail());
		buyDtlDto.setSeq_buy_mst(buyMstDto.getSeq_buy_mst());
		result += buyDao.insertDetail(buyDtlDto);
		
		PayDto payDto = new PayDto();
		payDto.setSeq_pay(payDao.sequence());
		payDto.setSeq_buy_mst(buyMstDto.getSeq_buy_mst());
		payDto.setDeal_num(deal_num);
		result += payDao.insert(payDto);
		
		if (result == 3) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	*/
	
	@Transactional("txFront")
	public boolean insert(BuyMstDto buyMstDto, ArrayList<BuyDtlDto> listBuyDtlDto, String deal_num) {
		
		int result = 0;
		
		buyMstDto.setSeq_buy_mst(buyDao.sequenceMaster());
		result += buyDao.insertMaster(buyMstDto);
				
		for (int loop = 0; loop < listBuyDtlDto.size(); loop++) {
			
			listBuyDtlDto.get(loop).setSeq_buy_dtl(buyDao.sequenceDetail());
			listBuyDtlDto.get(loop).setSeq_buy_mst(buyMstDto.getSeq_buy_mst());
			
			result += buyDao.insertDetail(listBuyDtlDto.get(loop));
		}
		
		PayDto payDto = new PayDto();
		payDto.setSeq_pay(payDao.sequence());
		payDto.setSeq_buy_mst(buyMstDto.getSeq_buy_mst());
		payDto.setDeal_num(deal_num);
		result += payDao.insert(payDto);
		
		if (result == 2 + listBuyDtlDto.size()) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
}
