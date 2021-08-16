package com.project.simple.verifyIamport;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.junit.Test;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {
	
private IamportClient client;
	
	public PaymentController() {
    	// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.client = new IamportClient("7287647296706666","rVuYmko5yfO9IzrEfeKSSqylUUL2BDZ3yt1UOq0mGOwooX3DbNv3e3o9YabzNbClEEgs5gPM5latje7v");
	}
	

	public void testCancelPaymentByImpUid() throws Exception {
		//이미 취소된 거래 imp_uid
		CancelData cancel1 = new CancelData("imp_448280090638", true);
		//IamportResponse<Payment> cancelpayment1 = client.cancelPayment(cancel1);
		//System.out.println(cancelpayment1.getMessage());
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport.do", method = RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid(Model model, HttpSession session, @RequestParam("imp_uid") String imp_uid ) throws IamportResponseException, IOException{			
		System.out.println(imp_uid);	
		return client.paymentByImpUid(imp_uid);
	}

	
	
	
}
