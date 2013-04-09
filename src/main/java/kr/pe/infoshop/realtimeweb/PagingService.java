package kr.pe.infoshop.realtimeweb;

import kr.pe.infoshop.page.model.Paging;

public class PagingService {
	
	public Paging getPagingList(int nCurrentPage,int nTotalRecordSize,int nRecordSize, int nBlockSize) {
		
		//nTotalRecordSize;    	//전체 record size
		//nCurrentPage;        	//현재 페이지
		//nRecordSize;         	//한 페이지당 보여줄 record size
		//nBlockSize;         		//한블록당 보여줄 블록 size 한블록당 보여줄 페이지수 [1][2][3][4][5][6][7][8][9][10] [다음]클릭시 [11][12][13]...
	
		Paging paging = new Paging();
	
		int nBlockGrpSize;        //블록 그룹 size
		int nTotalPageSize;      //전체 페이지수
		int nCurrentGrp;        	//현재 페이지의 블록 그룹번호

		int nStartPage  = 0;  	//페이징의 시작 페이지 번호
		int nEndPage    = 0;  	//페이징의 끝 페이지 번호

		String strLowNo = "";    //한페이지 보여줄 레코드 시작 번호_쿼리문의 파라메터로 사용
		String strHighNo = "";    //한페이지 보여줄 레코드 끝 번호_쿼리문의 파라메터로 사용

		nBlockGrpSize  = (int)Math.ceil((float)nTotalRecordSize / (float)(nRecordSize * nBlockSize))  ;    //블록 그룹 size
		nTotalPageSize = (int)Math.ceil( (float)nTotalRecordSize / (float)nRecordSize );    //전체 페이지수 
		nCurrentGrp = (int)Math.ceil( (float)nCurrentPage/(float)nBlockSize );    //현재 페이지가 속한 블록그룹번호

		//페이징의 시작페이지와  끝페이지 정의
		//만약 현재 페이지가 속한 그룹이 마지막 그룹이라면 .._10개짜리 페이지블록에서 [11][12][13] 요렇게  3개만 나와야 할경우
		if( nCurrentGrp == nBlockGrpSize ){
			nStartPage = (nCurrentGrp * nBlockSize) - (nBlockSize - 1);
			//마지막을 전체 페이지 번호까지
			nEndPage = nTotalPageSize;
		}
		//만약 현재 페이지가 속한 블록 그룹이 마지막블록그룹보다 작다면
		else if(nCurrentGrp < nBlockGrpSize){
			nStartPage = (nCurrentGrp * nBlockSize) - (nBlockSize - 1);
			nEndPage = nCurrentGrp * nBlockSize;
		}
		//레코드 범위  정의
		strLowNo = Integer.toString((nCurrentPage*nRecordSize)-(nRecordSize-1));
		strHighNo = Integer.toString((nCurrentPage*nRecordSize));

		paging.setnBlockGrpSize(nBlockGrpSize);
		paging.setnBlockSize(nBlockSize);
		paging.setnCurrentGrp(nCurrentGrp);
		paging.setnCurrentPage(nCurrentPage);
		paging.setnEndPage(nEndPage);
		paging.setnRecordSize(nRecordSize);
		paging.setnStartPage(nStartPage);
		paging.setnTotalPageSize(nTotalPageSize);
		paging.setnTotalRecordSize(nTotalRecordSize);
		paging.setStrHighNo(strHighNo);
		paging.setStrLowNo(strLowNo);
					
		return paging;
		
	}
}
