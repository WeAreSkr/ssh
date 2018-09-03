package cap.service;

import java.util.List;

import cap.bean.SysCategory;
import cap.util.PageControl;

public interface SysCategoryService {

	public abstract List<SysCategory> getAllSysCategory();

	public abstract SysCategory getById(int id);

	public abstract int count();

	public abstract PageControl getSysCategoryByPage(String curPageStr);

	public abstract SysCategory getByName(String scgName);

	public abstract int updateSysCategory(SysCategory sc);

	public abstract int insertSysCategory(SysCategory sc);

	public abstract int deleteSysCategory(int scgId);

}