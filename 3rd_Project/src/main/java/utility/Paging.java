package utility;

public class Paging {
<<<<<<< HEAD
	//ÆäÀÌÂ¡ °ü·Ã º¯¼ö	
	private int totalCount = 0 ; //ÃÑ ·¹ÄÚµå °Ç¼ö
	private int totalPage = 0 ; //ÀüÃ¼ ÆäÀÌÁö ¼ö
	private int pageNumber = 0 ; //º¸¿©ÁÙ ÆäÀÌÁö ³Ñ¹ö
	private int pageSize = 0 ; //ÇÑ ÆäÀÌÁö¿¡ º¸¿©ÁÙ °Ç¼ö
	private int beginRow = 0 ; //ÇöÀç ÆäÀÌÁöÀÇ ½ÃÀÛ Çà
	private int endRow = 0 ; //ÇöÀç ÆäÀÌÁöÀÇ ³¡ Çà
	private int pageCount = 3 ; // ÇÑ È­¸é¿¡ º¸¿©ÁÙ ÆäÀÌÁö ¸µÅ© ¼ö
	private int beginPage = 0 ; //ÆäÀÌÂ¡ Ã³¸® ½ÃÀÛ ÆäÀÌÁö ¹øÈ£
	private int endPage = 0 ; //ÆäÀÌÂ¡ Ã³¸® ³¡ ÆäÀÌÁö ¹øÈ£
	private int offset = 0 ;
	private int limit = 0 ;
	private String url = "" ;//¸î ÆäÀÌÁö¸¦ º¸µç list.ab¸¦ ¿äÃ» >>> list.ab¸¦ ¿äÃ»ÇÏ´Â º¯¼ö
	private String pagingHtml = "";//ÇÏ´ÜÀÇ ¼ıÀÚ ÆäÀÌÁö ¸µÅ©
	private String whatColumn = "" ; //°Ë»ö ¸ğµå(ÀÛ¼ºÀÚ, ±ÛÁ¦¸ñ)
	private String keyword = "" ; //°Ë»öÇÒ ´Ü¾î 

	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getBeginRow() {
		return beginRow;
	}


	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getOffset() {
		return offset;
	}


	public void setOffset(int offset) {
		this.offset = offset;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getPagingHtml() {
		System.out.println("pagingHtml:"+pagingHtml);
		
		return pagingHtml;

	}


	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String getWhatColumn() {
		return whatColumn;
	}


	public void setWhatColumn(String whatColumn) {
		this.whatColumn = whatColumn;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public Paging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url, 
			String whatColumn, 
			String keyword) {	//,String whologin	

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ;
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "5" ;   
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; // ÇÑ ÆäÀÌÁö¿¡ º¸¿©ÁÙ ·¹ÄÚµå °¹¼ö

		this.totalCount = totalCount ; //ÃÑ ÆäÀÌÁö ¼ö
								//Math.ceil >>> ½Ç¼ö °ª ¹İ ¿Ã¸²
		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ;
		
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		
		//»èÁ¦ÇÒ ¶§ ÇÊ¿äÇÑ ÀÛ¾÷, »èÁ¦ ÈÄ¿¡ ÀÌµ¿ÇÒ À§Ä¡
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		//°Ç³Ê ¶Û ·¹ÄÚµå °³¼ö : offset
		//if 3ÆäÀÌÁö¸¦ º¼ °Å¸é 4°³¸¦ °Ç³Ê ¶Ù¾î¾ß ÇÔ
		this.offset = ( pageNumber - 1 ) * pageSize ; 
		
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}
		//beginPage	: º¸ÀÌ´Â ½ÃÀÛ ÆäÀÌÁö, ¸¸¾à 1ÆäÀÌÁö¸¦ º¸°í ÀÖ´Ù¸é 1
		//endPage	: º¸ÀÌ´Â ³¡ ÆäÀÌÁö, ¸¸¾à 1ÆäÀÌÁö¸¦ º¸°í ÀÖ´Ù¸é 3
		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; //  /ex/list.ab
		this.whatColumn = whatColumn ;
		this.keyword = keyword ;
		System.out.println("whatColumn:"+whatColumn+"/keyword:"+keyword);
		
		//System.out.println("url2:"+url); //url2:/ex/list.ab
		this.pagingHtml = getPagingHtml(url) ;
		//¸ÇÃ³À½ ÀÌÀü 123 [´ÙÀ½]¸Ç ³¡
	}//»ı¼ºÀÚ
	
	private String getPagingHtml( String url ){ //ÆäÀÌÂ¡ ¹®ÀÚ¿­À» ¸¸µç´Ù.
		System.out.println("getPagingHtml url:"+url); 
		
		String result = "" ;
		String added_param = "&whatColumn=" + whatColumn + "&keyword=" + keyword ;
		
		//¸Ç Ã³À½, ÀÌÀü		 beginPage°¡ 1ÆäÀÌÁö°¡ ¾Æ´Ò ¶§
		if (this.beginPage != 1) {
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + ( 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>¸Ç Ã³À½</a>&nbsp;" ;
			result += "&nbsp;<a href='" + url 
					+ "?pageNumber=" + (this.beginPage - 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>ÀÌÀü</a>&nbsp;" ;
		}
		
		//°¡¿îµ¥
		for (int i = this.beginPage; i <= this.endPage ; i++) {
			if ( i == this.pageNumber ) {
				result += "&nbsp;<font color='red'>" + i + "</font>&nbsp;"	;
						
			} else {
				result += "&nbsp;<a href='" + url   
						+ "?pageNumber=" + i + "&pageSize=" + this.pageSize 
						+ added_param + "'>" + i + "</a>&nbsp;" ;
				
			}
		}
		
		System.out.println("result:"+result); 
		System.out.println();
		//´ÙÀ½, ¸Ç ³¡
		if ( this.endPage != this.totalPage) { 
			
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + (this.endPage + 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>´ÙÀ½</a>&nbsp;" ;
			
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + (this.totalPage ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>¸Ç ³¡</a>&nbsp;" ;
		}		
		System.out.println("result2:"+result);
		
		return result ;
	}	
	
}

=======
	
	private int totalCount = 0 ; //ì´ ë ˆì½”ë“œ ê±´ìˆ˜
	private int totalPage = 0 ; //ì „ì²´ í˜ì´ì§€ ìˆ˜
	private int pageNumber = 0 ; 
	private int pageSize = 0 ; //í•œ í˜ì´ì§€ì— ë³´ì—¬ì¤„ ê±´ìˆ˜
	private int beginRow = 0 ;
	private int endRow = 0 ; 
	private int pageCount = 3 ; // í•œ í™”ë©´ì— ë³´ì—¬ì¤„ í˜ì´ì§€ ìˆ˜
	private int beginPage = 0 ; //í˜ì´ì§• ì²˜ë¦¬ ì‹œì‘ í˜ì´ì§€ ë²ˆí˜¸
	private int endPage = 0 ; //í˜ì´ì§• ì²˜ë¦¬ ë í˜ì´ì§€ ë²ˆí˜¸
	private int offset = 0 ;
	private int limit = 0 ;
	private String url = "" ;
	private String pagingHtml = ""; //í•˜ë‹¨ ìˆ«ì í˜ì´ì§€ 
	private String whatColumn = "" ; 
	private String keyword = "" ; //ê²€ìƒ‰í•  ë‹¨ì–´ 

	public int getTotalCount() {
		return totalCount;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public int getPageNumber() {
		return pageNumber;
	}


	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getBeginRow() {
		return beginRow;
	}


	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public int getPageCount() {
		return pageCount;
	}


	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}


	public int getBeginPage() {
		return beginPage;
	}


	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getOffset() {
		return offset;
	}


	public void setOffset(int offset) {
		this.offset = offset;
	}


	public int getLimit() {
		return limit;
	}


	public void setLimit(int limit) {
		this.limit = limit;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getPagingHtml() {
		System.out.println("pagingHtml:"+pagingHtml);
		
		return pagingHtml;

	}


	public void setPagingHtml(String pagingHtml) {
		this.pagingHtml = pagingHtml;
	}

	public String getWhatColumn() {
		return whatColumn;
	}


	public void setWhatColumn(String whatColumn) {
		this.whatColumn = whatColumn;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public Paging(
			String _pageNumber, 
			String _pageSize,  
			int totalCount,
			String url,   
			String whatColumn, 
			String keyword) {		

		if(  _pageNumber == null || _pageNumber.equals("null") || _pageNumber.equals("")  ){
			System.out.println("_pageNumber:"+_pageNumber); // null
			_pageNumber = "1" ;
		}
		this.pageNumber = Integer.parseInt( _pageNumber ) ; 

		if( _pageSize == null || _pageSize.equals("null") || _pageSize.equals("") ){
			_pageSize = "5" ; 
		}		
		this.pageSize = Integer.parseInt( _pageSize ) ;
		
		this.limit = pageSize ; 

		this.totalCount = totalCount ; 

		this.totalPage = (int)Math.ceil((double)this.totalCount / this.pageSize) ;
		
		this.beginRow = ( this.pageNumber - 1 )  * this.pageSize  + 1 ;
		this.endRow =  this.pageNumber * this.pageSize ;
		
 
		if( this.pageNumber > this.totalPage ){
			this.pageNumber = this.totalPage ;
		}
		
		this.offset = ( pageNumber - 1 ) * pageSize ; 
		
		if( this.endRow > this.totalCount ){
			this.endRow = this.totalCount  ;
		}

		this.beginPage = ( this.pageNumber - 1 ) / this.pageCount * this.pageCount + 1  ;
		this.endPage = this.beginPage + this.pageCount - 1 ;
		
		System.out.println("pageNumber:"+pageNumber+"/totalPage:"+totalPage);	
		
		if( this.endPage > this.totalPage ){
			this.endPage = this.totalPage ;
		}
		
		System.out.println("pageNumber2:"+pageNumber+"/totalPage2:"+totalPage);	
		this.url = url ; 
		this.whatColumn = whatColumn ;
		this.keyword = keyword ;
		System.out.println("whatColumn:"+whatColumn+"/keyword:"+keyword);
		
		this.pagingHtml = getPagingHtml(url) ;
		
	} // ìƒì„±ì
	
	private String getPagingHtml( String url ){ 
		System.out.println("getPagingHtml url:"+url); 
		
		String result = "" ;
		String added_param = "&whatColumn=" + whatColumn + "&keyword=" + keyword ;
		
		if (this.beginPage != 1) {
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + ( 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>ë§¨ ì²˜ìŒ</a>&nbsp;" ;
			result += "&nbsp;<a href='" + url 
					+ "?pageNumber=" + (this.beginPage - 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>ì´ì „</a>&nbsp;" ;
		}
		
		//ê°€ìš´ë°
		for (int i = this.beginPage; i <= this.endPage ; i++) {
			if ( i == this.pageNumber ) {
				result += "&nbsp;<font color='red'>" + i + "</font>&nbsp;"	;
						
			} else {
				result += "&nbsp;<a href='" + url   
						+ "?pageNumber=" + i + "&pageSize=" + this.pageSize 
						+ added_param + "'>" + i + "</a>&nbsp;" ;
				
			}
		}
		
		System.out.println("result:"+result); 
		System.out.println();
		
		if ( this.endPage != this.totalPage) { 
			
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + (this.endPage + 1 ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>ë‹¤ìŒ</a>&nbsp;" ;
			
			result += "&nbsp;<a href='" + url  
					+ "?pageNumber=" + (this.totalPage ) + "&pageSize=" + this.pageSize 
					+ added_param + "'>ë§¨ ë</a>&nbsp;" ;
		}		
		System.out.println("result2:"+result);
		
		return result ;
	}	
	
}
>>>>>>> branch 'master' of https://github.com/BeTheBestSY/3rd_Project.git
