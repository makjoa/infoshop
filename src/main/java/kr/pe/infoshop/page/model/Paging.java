package kr.pe.infoshop.page.model;

public class Paging {

	private int nTotalRecordSize;     	//전체 record size
	private int nRecordSize;				//한 페이지당 보여줄 record size
	private int nBlockSize;         		//한블록당 보여줄 블록 size
	private int nBlockGrpSize;        		//블록 그룹 size
	private int nTotalPageSize;        	//전체 페이지수
	private int nCurrentPage;        		//현재 페이지
	private int nCurrentGrp;       	 	//현재 페이지의 블록 그룹번호
	private int nStartPage     = 0;    	//페이징의 시작 페이지 번호
	private int nEndPage    = 0;    		//페이징의 끝 페이지 번호

	private String strLowNo = "";    		//한페이지 보여줄 레코드 시작 번호_쿼리문의 파라메터로 사용
	private String strHighNo = "";    		//한페이지 보여줄 레코드 끝 번호_쿼리문의 파라메터로 사용

	public int getnTotalRecordSize() {
		return nTotalRecordSize;
	}
	public void setnTotalRecordSize(int nTotalRecordSize) {
		this.nTotalRecordSize = nTotalRecordSize;
	}
	
	public int getnRecordSize() {
		return nRecordSize;
	}
	public void setnRecordSize(int nRecordSize) {
		this.nRecordSize = nRecordSize;
	}
		
	public int getnBlockSize() {
		return nBlockSize;
	}
	public void setnBlockSize(int nBlockSize) {
		this.nBlockSize = nBlockSize;
	}
	public int getnBlockGrpSize() {
		return nBlockGrpSize;
	}
	public void setnBlockGrpSize(int nBlockGrpSize) {
		this.nBlockGrpSize = nBlockGrpSize;
	}
	public int getnTotalPageSize() {
		return nTotalPageSize;
	}
	public void setnTotalPageSize(int nTotalPageSize) {
		this.nTotalPageSize = nTotalPageSize;
	}
	public int getnCurrentPage() {
		return nCurrentPage;
	}
	public void setnCurrentPage(int nCurrentPage) {
		this.nCurrentPage = nCurrentPage;
	}
	public int getnCurrentGrp() {
		return nCurrentGrp;
	}
	public void setnCurrentGrp(int nCurrentGrp) {
		this.nCurrentGrp = nCurrentGrp;
	}
	public int getnStartPage() {
		return nStartPage;
	}
	public void setnStartPage(int nStartPage) {
		this.nStartPage = nStartPage;
	}
	public int getnEndPage() {
		return nEndPage;
	}
	public void setnEndPage(int nEndPage) {
		this.nEndPage = nEndPage;
	}
	public String getStrLowNo() {
		return strLowNo;
	}
	public void setStrLowNo(String strLowNo) {
		this.strLowNo = strLowNo;
	}
	public String getStrHighNo() {
		return strHighNo;
	}
	public void setStrHighNo(String strHighNo) {
		this.strHighNo = strHighNo;
	}

}
