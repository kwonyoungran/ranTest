package kr.co.hanandong.common.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
    
	@Autowired
	@Resource(name="sqlSessionTemplate_mysql")
	protected SqlSessionTemplate dataSource_mysql;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectPagingList(String queryId, Object params, SqlSessionTemplate sessionTemplate) {
		printQueryId(queryId);
		
		Map<String,Object> map = (Map<String,Object>) params;
	    PaginationInfo paginationInfo = null;
	    
	    if(map.containsKey("currentPageNo") == false || StringUtils.isEmpty(map.get("currentPageNo")) == true)
	    	map.put("currentPageNo", "1");
	    
	    paginationInfo = new PaginationInfo();
	    paginationInfo.setCurrentPageNo(Integer.parseInt(map.get("currentPageNo").toString()));		//현재 페이지 번호
	    if(map.containsKey("PAGE_ROW") == false || StringUtils.isEmpty(map.get("PAGE_ROW")) == true) {
	        paginationInfo.setRecordCountPerPage(10);	//한 페이지에 게시되는 게시물 건수
	    }
	    else {
	        paginationInfo.setRecordCountPerPage(Integer.parseInt(map.get("PAGE_ROW").toString()));
	    }
	    paginationInfo.setPageSize(10);	//페이징 리스트의 사이즈
	    
	    int start = paginationInfo.getFirstRecordIndex();
	    int end = start + paginationInfo.getRecordCountPerPage();
	    map.put("START", start+1);
	    map.put("END", end);
	    
	    params = map;
	    
	    Map<String,Object> returnMap = new HashMap<String,Object>();
	    List<Map<String,Object>> list = sessionTemplate.selectList(queryId, params);
	    
	    if(list.size() == 0) {
//	        map = new HashMap<String,Object>();
//	        map.put("total_count",0);  
//	        list.add(map);
	         
	        if(paginationInfo != null) {
	            paginationInfo.setTotalRecordCount(0);	//전체 게시물 건 수
	            returnMap.put("paginationInfo", paginationInfo);
	        }
	    }
	    else{
	        if(paginationInfo != null) {
	            paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).get("total_count").toString()));
	            returnMap.put("paginationInfo", paginationInfo);
	        }
	    }
	    
	    returnMap.put("result", list);
	    return returnMap;
	}

    protected void printQueryId(String queryId) {
        if(log.isDebugEnabled()){
            log.debug("\t QueryId  \t:  " + queryId);
        }
    }
//     
//    public Object insert(String queryId, Object params) {
//        printQueryId(queryId);
//        return dataSource_mms.insert(queryId, params);
//    }
//     
//    public Object update(String queryId, Object params) {
//        printQueryId(queryId);
//        return dataSource_mms.update(queryId, params);
//    }
//     
//    public Object delete(String queryId, Object params) {
//        printQueryId(queryId);
//        return dataSource_mms.delete(queryId, params);
//    }
//     
//    public Object selectOne(String queryId) {
//        printQueryId(queryId);
//        return dataSource_mms.selectOne(queryId);
//    }
//     
//    public Object selectOne(String queryId, Object params) {
//        printQueryId(queryId);
//        return dataSource_mms.selectOne(queryId, params);
//    }
//     
//    @SuppressWarnings("rawtypes")
//    public List selectList(String queryId) {
//        printQueryId(queryId);
//        return dataSource_mms.selectList(queryId);
//    }
//     
//    @SuppressWarnings("rawtypes")
//    public List selectList(String queryId, Object params) {
//        printQueryId(queryId);
//        return dataSource_mms.selectList(queryId,params);
//    }
}
