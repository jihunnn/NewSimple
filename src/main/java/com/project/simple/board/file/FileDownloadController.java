package com.project.simple.board.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FileDownloadController {
	private static final String ARTICLE_IMAGE_REPO_product = "C:\\spring\\product_image";
	private static final String ARTICLE_IMAGE_REPO_inquiry = "C:\\spring\\inquiry_image";
	private static final String ARTICLE_IMAGE_REPO_asCenter = "C:\\spring\\asCenter_image";
	private static final String ARTICLE_IMAGE_REPO_review = "C:\\spring\\review_image";
	private static final String ARTICLE_IMAGE_REPO_notice = "C:\\spring\\notice_image";

	@RequestMapping("/download.do")
	protected void download(@RequestParam("inquiryFile") String inquiryFile,
			@RequestParam("inquiryNum") String inquiryNum, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO_inquiry + "\\" + inquiryNum + "\\" + inquiryFile;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + inquiryFile);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download_asCenter.do")
	protected void download_asCenter(@RequestParam("asCenterFile") String asCenterFile,
			@RequestParam("asCenterNum") String asCenterNum, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO_asCenter + "\\" + asCenterNum + "\\" + asCenterFile;
		File file = new File(downFile);

		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + asCenterFile);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	@RequestMapping("/download_product.do")
	protected void download_product(@RequestParam("productImage") String productImage,
			@RequestParam("productNum") String productNum, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();

		String downFile = ARTICLE_IMAGE_REPO_product + "\\" + productNum + "\\" + productImage;
		File file = new File(downFile);
		System.out.println(productNum);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + productImage);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}

	@RequestMapping("/download_product1.do")
	protected void download_product1(@RequestParam("productContentImage") String productImage,
			@RequestParam("productNum") String productNum, HttpServletResponse response ) throws Exception {
		OutputStream out = response.getOutputStream();

		String downFile = ARTICLE_IMAGE_REPO_product + "\\" + productNum + "\\" + productImage;
		File file = new File(downFile);
		System.out.println(productNum);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + productImage);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download_review.do")
	protected void download_review(@RequestParam("reviewFile") String reviewFile,
			@RequestParam("reviewNum") String reviewNum, HttpServletResponse response, HttpServletRequest request) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO_review + "\\" + reviewNum + "\\" + reviewFile;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + reviewFile);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/download_notice.do")
	protected void download_notice(@RequestParam("noticeImg") String noticeImg,
			@RequestParam("noticeNum") String noticeNum, HttpServletResponse response, HttpServletRequest request) throws Exception {
		OutputStream out = response.getOutputStream();
		String downFile = ARTICLE_IMAGE_REPO_notice + "\\" + noticeNum + "\\" + noticeImg;
		File file = new File(downFile);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + noticeImg);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = in.read(buffer);
			if (count == -1)
				break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	
	


}
