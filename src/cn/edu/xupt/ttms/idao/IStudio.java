package cn.edu.xupt.ttms.idao;

import java.util.ArrayList;

import cn.edu.xupt.ttms.model.Studio;

public interface IStudio {

	// 增
    public boolean insert(Studio studio);

    // 删
    public boolean delete(int studio_id);

    // 改
    public boolean update(Studio studio);


    // 查
    public Studio findStudioById(int studio_id);
    
    public ArrayList<Studio> findAllStudio();
    
    public ArrayList<Studio> findStudioByPage(int cPage, String studio_name);
}
