package cap.service;

import java.util.List;

import cap.bean.Category;
import cap.util.PageControl;

public interface CategoryService {

	public abstract List<Category> getByUserId(int userId);

	public abstract Category getById(int id);

	public abstract Category getByName(String cgName, int userId);

	public abstract int insertCategory(int userId, String cgName);

	public abstract int updateCategory(Category cg);

	public abstract int deleteCategory(int cgId);
	
	public PageControl getCategoryByPage(String curPageStr, int size) ;

	/*
	 * 根据用户id获得分页列表
	 */
	public abstract PageControl getCategoryByUserId(String curPageStr,
			int userId);

}