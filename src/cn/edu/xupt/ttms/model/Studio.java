package cn.edu.xupt.ttms.model;

public class Studio {
	private int studio_id;
	private String studio_name;
	private int row_count;
	private int col_count;
	private String studio_introduction;
	private int studio_flag; //0:未生成座位     1：已生成座位     -1： 已损坏
	public int getStudio_id() {
		return studio_id;
	}
	public void setStudio_id(int studio_id) {
		this.studio_id = studio_id;
	}
	public String getStudio_name() {
		return studio_name;
	}
	public void setStudio_name(String studio_name) {
		this.studio_name = studio_name;
	}
	public int getRow_count() {
		return row_count;
	}
	public void setRow_count(int row_count) {
		this.row_count = row_count;
	}
	public int getCol_count() {
		return col_count;
	}
	public void setCol_count(int col_count) {
		this.col_count = col_count;
	}
	public String getStudio_introduction() {
		return studio_introduction;
	}
	public void setStudio_introduction(String studio_introduction) {
		this.studio_introduction = studio_introduction;
	}
	public int getStudio_flag() {
		return studio_flag;
	}
	public void setStudio_flag(int studio_flag) {
		this.studio_flag = studio_flag;
	}
	
	
	
}
