/**
 * 
 */
package zjgsu.jk.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.hibernate.validator.constraints.URL;

/**
 * @author zkj
 *
 */
@Entity
public class Course extends AuditableModel {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2617919294300762276L;
	private String name;
	private String avater;
	private boolean freeflag;//是否免费	
	@Column(precision = 2)
	private BigDecimal price; //保留两位小数
	@URL
	private String filepath;
	@URL
	private String avatar; //上传视频时附带的首页图像
	private Integer view;//浏览次数
	private String introduction; //课程简介
	private Integer duration;  //课程时长
	private Integer studentnum; //在线学习人数
	private String level; //课程难度
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isFreeflag() {
		return freeflag;
	}
	public void setFreeflag(boolean freeflag) {
		this.freeflag = freeflag;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getAvater() {
		return avater;
	}
	public void setAvater(String avater) {
		this.avater = avater;
	}
	
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Integer getDuration() {
		return duration;
	}
	public void setDuration(Integer duration) {
		this.duration = duration;
	}
	public Integer getStudentnum() {
		return studentnum;
	}
	public void setStudentnum(Integer studentnum) {
		this.studentnum = studentnum;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
}
