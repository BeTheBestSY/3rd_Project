package celeb.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import c_board.model.CBoardBean;
import celeb.model.CelebBean;

@Component("CelebDao")
public class CelebDao {

	private String namespace="celeb.model.CelebBean.";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<CelebBean> getCeleb(String cl_color) {
		List<CelebBean> list =  sqlSessionTemplate.selectList(namespace+"getCeleb",cl_color);
		return list;
	}

	
}
