package com.yinlz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**dao底层操作处理工具类*/
@Repository
public class DaoBase{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSession;

	/**
	 * 通用的更新;删除;插入添加
	 * @作者 田应平
	 * @返回值类型 int
	 * @创建时间 2016年12月24日 23:00:14
	 * @QQ号码 444141300
	 * @主页 http://www.fwtai.com
	*/
	public int execute(final String sqlMapId) throws Exception {
		return sqlSession.update(sqlMapId);
	}

	/**
	 * 通用的更新;删除;插入添加
	 * @作者 田应平
	 * @返回值类型 int
	 * @创建时间 2016年12月24日 23:00:09
	 * @QQ号码 444141300
	 * @主页 http://www.fwtai.com
	*/
	public int execute(final String sqlMapId,final Object objParam) throws Exception{
		return sqlSession.update(sqlMapId,objParam);
	}
	
	/**批量插入|更新|删除*/
	public int executeBatch(final String sqlMapId) throws Exception {
		return sqlSession.update(sqlMapId);
	}
	
	/**批量插入|更新|删除,objParam可以是List<HashMap<String, Object>>*/
	public int executeBatch(final String sqlMapId, final Object objParam) throws Exception {
		return sqlSession.update(sqlMapId,objParam);
	}

    /**
     * 查询对象数据对象
     * @param sqlMapId
     * @作者 田应平
     * @返回值类型 PageFormData
     * @创建时间 2016年12月24日 下午11:12:57
     * @QQ号码 444141300
     * @官网 http://www.yinlz.com
    */
    public <T> T queryForEntity(final String sqlMapId){
        return sqlSession.selectOne(sqlMapId);
    }

    /**
     * 查询对象数据对象
     * @param sqlMapId
     * @param objParam
     * @作者 田应平
     * @返回值类型 PageFormData
     * @创建时间 2016年12月25日 上午12:46:20
     * @QQ号码 444141300
     * @官网 http://www.yinlz.com
    */
    public <T> T queryForEntity(final String sqlMapId, final Object objParam){
        return sqlSession.selectOne(sqlMapId,objParam);
    }

    /**
     * 返回List集合
     * @作者 田应平
     * @返回值类型 int
     * @创建时间 2016年12月24日 23:00:14
     * @QQ号码 444141300
     * @主页 http://www.yinlz.com
    */
    public <T> List<T> selectListEntity(final String sqlMapId){
        return sqlSession.selectList(sqlMapId);
    }

    /**
     * 带参数的LIST
     * @作者 田应平
     * @返回值类型 int
     * @创建时间 2016年12月24日 23:00:14
     * @QQ号码 444141300
     * @主页 http://www.yinlz.com
    */
    public <T> List<T> selectListEntity(final String sqlMapId, final Object objParam){
        return sqlSession.selectList(sqlMapId, objParam);
    }
}