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
 * File			: BoardSrvc.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20231201171351][pluto@himedia.co.kr][CREATE: Initial Release]
 */
package kr.co.himedia.ecommerce.common.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import kr.co.himedia.ecommerce.common.dao.BoardDao;
import kr.co.himedia.ecommerce.common.dto.BoardDto;
import kr.co.himedia.ecommerce.common.dto.PagingDto;
import kr.co.himedia.ecommerce.common.dto.PagingListDto;
//import kr.co.himedia.ecommerce.front.customer.dto.CustomerDto;

/**
 * @version 1.0.0
 * @author pluto@himedia.co.kr
 * 
 * @since 2023-12-01
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Service("kr.co.himedia.ecommerce.common.service.BoardSrvc")
public class BoardSrvc {
	
	@Inject
	BoardDao boardDao;
	
	public PagingListDto mylist(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = boardDao.count(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(0);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(boardDao.mylist(pagingDto));
		
		return pagingListDto;
	}
	
	public PagingListDto list(PagingDto pagingDto) {
		
		PagingListDto pagingListDto = new PagingListDto();
		
		int totalLine = boardDao.count(pagingDto);
		int totalPage = (int)Math.ceil((double)totalLine / (double)pagingDto.getLinePerPage());
		pagingDto.setTotalLine(totalLine);
		pagingDto.setTotalPage(totalPage);
		if (totalPage == 0) pagingDto.setCurrentPage(0);
		
		pagingListDto.setPaging(pagingDto);
		pagingListDto.setList(boardDao.list(pagingDto));
		
		return pagingListDto;
	}
	
	@Transactional("txCommon")
	public boolean insert(BoardDto boardDto) {
		
		// 신규 글 번호 설정
		boardDto.setSeq_bbs(boardDao.sequence());
		
		int result = boardDao.insert(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	public BoardDto select(BoardDto boardDto) {
		return boardDao.select(boardDto);
	}
	
	public BoardDto checkSecret(BoardDto boardDto) {
		return boardDao.checkSecret(boardDto);		
	}	
	
	@Transactional("txCommon")
	public boolean update(BoardDto boardDto) {
		
		int result = boardDao.update(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
	}
	
	
	
	/*@Transactional("txCommon")
	public boolean cd_delete(BoardDto boardDto) {
	   
	        // 게시물을 실제로 삭제하는 메서드 호출
	        int affectedRows = boardDao.cd_delete(boardDto);
	        
	        // 삭제가 성공적으로 이루어졌을 경우
	        if (affectedRows > 0) {
	            return true;
	        } else {
	            // 삭제에 실패하면 롤백
	            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	            return false;
	        }*/
	@Transactional("txCommon")
	public boolean deleteFlag(BoardDto boardDto) {
		
		int result = boardDao.deleteFlag(boardDto);
		
		if (result == 1) return true;
		else {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return false;
		}
		}

	
	}
	   
