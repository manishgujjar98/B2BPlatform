package com.trend.utils;

import java.util.Random;

public class CommonsUtils {

	public static void main(String[] args) {
		System.out.println(getID());
	}

	/**
	 * This method is used to Create Order Numbers by using system time with
	 * nano seconds
	 * 
	 * @param int
	 *            This parameter contains length of the order number
	 * @return String returns order number.
	 */
	public static String getID() {
		int numOfCharacters = 9;
		StringBuffer buffer = new StringBuffer();
		Random random = new Random(System.nanoTime());
		char[] chars = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		do {
			buffer = new StringBuffer();
			buffer.append(chars[random.nextInt(chars.length)]);
		} while (buffer.toString().contains("0"));
		for (int i = 1; i < numOfCharacters; i++) {
			buffer.append(chars[random.nextInt(chars.length)]);
		}
		return buffer.toString();
	}

	/**
	 * This method is used to generate random string.
	 * 
	 * @param nothing
	 *            .
	 * @return String.
	 */
	public static String generateRandomString() {
		int passwordLength = 6;
		int type = 4;
		final String allowedChars = "abcdefghijkmnopqrstuvwxyz";
		final String allowedCharsWithCaps = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ";
		final String allowedCharsWithCapsAndNumbers = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
		final String allowedCharsWithCapsAndNumbersAndSymbols = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789!@$?_-";

		String chars = "";
		Random rd = new Random();
		String passwordCombinations = "";

		switch (type) {
		case 1:
			passwordCombinations = allowedChars;
			break;
		case 2:
			passwordCombinations = allowedCharsWithCaps;
			break;
		case 3:
			passwordCombinations = allowedCharsWithCapsAndNumbers;
			break;
		case 4:
			passwordCombinations = allowedCharsWithCapsAndNumbersAndSymbols;
			break;
		default:
			passwordCombinations = allowedChars;
			break;
		}
		for (int i = 0; i < passwordLength; i++) {
			chars = chars + passwordCombinations.charAt(rd.nextInt(passwordCombinations.length()));
		}
		return chars;
	}

}
