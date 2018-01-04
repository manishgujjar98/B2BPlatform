package com.trendset.util.services;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import com.trendset.utils.PropertiesUtils;

public class SMSServices {

	public static void main(String[] args) throws IOException, Exception {

		// SMSServices SMSServices = new SMSServices();
		sendSMS("3095508380", "Welcome to TrendSetr");

		/*
		 * 
		 * 
		 * 
		 * String url="https://rest.nexmo.com/sms/json";
		 * 
		 * URL obj = new URL(url);
		 * 
		 * HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		 * 
		 * con.setRequestMethod("GET"); con.setRequestProperty("User-Agent",
		 * "Mozilla/5.0"); con.setRequestProperty("Accept-Language",
		 * "en-US;en;q=0.5");
		 * 
		 * 
		 * String urlParameters = "api_key=" + APIKEY +"&api_secret=" +
		 * APISECRET + "&to=" + TO + "&from=" + FROM + "&text=" + TEXT;
		 * 
		 * // Send post request con.setDoOutput(true); DataOutputStream wr = new
		 * DataOutputStream(con.getOutputStream());
		 * wr.writeBytes(urlParameters); wr.flush(); wr.close();
		 * 
		 * int responseCode = con.getResponseCode();
		 * System.out.println("\nSending 'GET' request to URL : " + url);
		 * System.out.println("GET parameters : " + urlParameters);
		 * System.out.println("Response Code : " + responseCode);
		 * 
		 * BufferedReader in = new BufferedReader( new
		 * InputStreamReader(con.getInputStream())); String inputLine;
		 * StringBuffer response = new StringBuffer();
		 * 
		 * while ((inputLine = in.readLine()) != null) {
		 * response.append(inputLine); } in.close();
		 * 
		 * //print result System.out.println(response.toString());
		 */}

	public static String sendSMS(String to, String content) {

		try {
			PropertiesUtils pop = PropertiesUtils.getInstance();

			String url = pop.getValue("smsUrl");

			URL obj = new URL(url);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent", "Mozilla/5.0");
			con.setRequestProperty("Accept-Language", "en-US;en;q=0.5");

			String urlParameters = "api_key=" + pop.getValue("APIKEY") + "&api_secret=" + pop.getValue("APISECRET")
					+ "&to=1" + to + "&from=" + pop.getValue("FROM") + "&text=" + content;

			// Send post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(urlParameters);
			wr.flush();
			wr.close();

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + url);
			System.out.println("GET parameters : " + urlParameters);
			System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();
			System.out.println(response.toString());

			return response.toString();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
}
