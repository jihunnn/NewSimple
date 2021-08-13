package com.project.simple.product.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("optionVO")
public class OptionVO {

	private String productNum;
	private int optionNum;
	private String option1Name;
	private String option1value;
	private int option1price;
	private String option2Name;
	private String option2value;
	private int option2price;

	public String getProductNum() {
		return productNum;
	}

	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}

	public String getOption1Name() {
		return option1Name;
	}

	public void setOption1Name(String option1Name) {
		this.option1Name = option1Name;
	}

	public String getOption1value() {
		return option1value;
	}

	public void setOption1value(String option1value) {
		this.option1value = option1value;
	}

	public int getOption1price() {
		return option1price;
	}

	public void setOption1price(int option1price) {
		this.option1price = option1price;
	}

	public String getOption2Name() {
		return option2Name;
	}

	public void setOption2Name(String option2Name) {
		this.option2Name = option2Name;
	}

	public String getOption2value() {
		return option2value;
	}

	public void setOption2value(String option2value) {
		this.option2value = option2value;
	}

	public int getOption2price() {
		return option2price;
	}

	public void setOption2price(int option2price) {
		this.option2price = option2price;
	}

	public int getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(int optionNum) {
		this.optionNum = optionNum;
	}

}
