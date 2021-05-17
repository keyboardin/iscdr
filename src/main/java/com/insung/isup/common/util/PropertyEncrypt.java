package com.insung.isup.common.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class PropertyEncrypt {


	public static void main(String[] args) {
		
		StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor(); 
		
		pbeEnc.setAlgorithm("PBEWithMD5AndDES");
	    pbeEnc.setPassword("passwdkey");

	    String username = pbeEnc.encrypt("insung");
	    String password = pbeEnc.encrypt("!Insung2018@");

	    System.out.println(username);
	    System.out.println(password); 
	}
		
	
}