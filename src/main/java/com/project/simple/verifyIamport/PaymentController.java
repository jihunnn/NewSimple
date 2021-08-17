package com.project.simple.verifyIamport;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Locale;

import javax.net.ssl.SSLEngineResult.Status;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpStatus;
import org.apache.maven.model.Model;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class PaymentController {

	private IamportClient client;

	public PaymentController() {
		// REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
		this.client = new IamportClient("7287647296706666",
				"rVuYmko5yfO9IzrEfeKSSqylUUL2BDZ3yt1UOq0mGOwooX3DbNv3e3o9YabzNbClEEgs5gPM5latje7v");

	}

	
	@RequestMapping(value="/verifyIamport.do", method = RequestMethod.POST)
	public ResponseEntity paymentByImpUid(Model model,  HttpServletRequest request, @RequestParam("imp_uid") String imp_uid ) throws IamportResponseException, IOException{			
			
		HashMap<String, Object> data = new HashMap();
		ResponseEntity resEntity = null;

		IamportResponse<Payment> payment = client.paymentByImpUid(imp_uid);
		Payment paymentData = payment.getResponse();
		BigDecimal amount = paymentData.getAmount();
		paymentData.getCardNumber();
		
		int int_Amount = amount.intValue();
		
		HttpSession session1 = request.getSession();
		String totalPrice =  (String) session1.getAttribute("totalPrice");
		int int_totalPrice = Integer.parseInt(totalPrice);
		
		if(int_Amount == int_totalPrice) {
			
			data.put("status", "success");
			data.put("payInfo", payment);
			//resEntity = new ResponseEntity(data,HttpStatus.SC_OK);
		}
		
		else if(int_Amount != int_totalPrice) {
			
			
			CancelData cancel1 = new CancelData(imp_uid, true);
			IamportResponse<Payment> cancelpayment1 = client.cancelPaymentByImpUid(cancel1);
			
			data.put("status", "failed");
			data.put("payInfo", payment);
			//resEntity = new ResponseEntity(data,HttpStatus.SC_BAD_REQUEST);
		}
		return resEntity;
	}

}
