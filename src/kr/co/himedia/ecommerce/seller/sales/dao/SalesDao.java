/**
 * YOU ARE STRICTLY PROHIBITED TO COPY, DISCLOSE, DISTRIBUTE, MODIFY OR USE THIS PROGRAM
 * IN PART OR AS A WHOLE WITHOUT THE PRIOR WRITTEN CONSENT OF HIMEDIA.CO.KR.
 * HIMEDIA.CO.KR OWNS THE INTELLECTUAL PROPERTY RIGHTS IN AND TO THIS PROGRAM.
 * COPYRIGHT (C) 2024 HIMEDIA.CO.KR ALL RIGHTS RESERVED.
 *
 * 하기 프로그램에 대한 저작권을 포함한 지적재산권은 himedia.co.kr에 있으며,
 * himedia.co.kr이 명시적으로 허용하지 않는 사용, 복사, 변경 및 제 3자에 의한 공개, 배포는 엄격히 금지되며
 * himedia.co.kr의 지적재산권 침해에 해당된다.
 * Copyright (C) 2024 himedia.co.kr All Rights Reserved.
 *
 *
 * Program		: kr.co.himedia.sn.ecommerce5th.mercury
 * Description	:
 * Environment	: JRE 1.7 or more
 * File			: salesDao.java
 * Notes		:
 * History		: [NO][Programmer][Description]
 *				: [20240403160816][wlstlr@himedia.co.kr][CREATE: Initial Release]
 */
package kr.co.himedia.ecommerce.seller.sales.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.himedia.ecommerce.common.dto.PagingDto;
import kr.co.himedia.ecommerce.seller.common.dao.BaseDao;
import kr.co.himedia.ecommerce.seller.sales.dto.SalesDto;

/**
 * @version 1.0.0
 * @author wlstlr@himedia.co.kr
 * 
 * @since 2024-04-03
 * <p>DESCRIPTION:</p>
 * <p>IMPORTANT:</p>
 */
@Repository("kr.co.himedia.ecommerce.seller.sales.dao.SalesDao")
public class SalesDao extends BaseDao {

	public List<SalesDto> select(SalesDto salesDto) {
		return sqlSessionSeller.selectList("kr.co.himedia.ecommerce.seller.mybatis.sales.Sales.select", salesDto);
	}
	
	public int count(PagingDto pagingDto) {
		return sqlSessionSeller.selectOne("kr.co.himedia.ecommerce.seller.mybatis.sales.Sales.count", pagingDto);
	}
	
	public List<SalesDto> list(PagingDto pagingDto) {
		return sqlSessionSeller.selectList("kr.co.himedia.ecommerce.seller.mybatis.sales.Sales.list", pagingDto);
	}
}
