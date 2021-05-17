/**
* 모듈명 : iSHA
* 설명 : SHA를 사용해서 암호화 및 복호화(비교)를 수행
**/
package com.insung.isup.common.util;

import java.security.MessageDigest;
//import javax.commerce.util.BASE64Decoder;
//import javax.commerce.util.BASE64Encoder;


import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
// An alternative: import util.BASE64Encoder; // http://professionals.com/~cmcmanis/java/encoders/

public class iSHA {
	private MessageDigest sha; 

    //복호화(Password Check)
	@SuppressWarnings("static-access")
	public boolean chkSHA(String digest, String compStr, boolean verbose) 
		throws	java.io.IOException, java.security.NoSuchAlgorithmException { 
			// digest: SHA로 변형된 String, 입력받은 일반 String

		sha = MessageDigest.getInstance ("SHA-1");
		//Label 짜르기
	    if (digest.regionMatches (true, 0, "{SHA}", 0, 5)) {
			digest = digest.substring (5); // ignore the label
	    } else if (digest.regionMatches (true, 0, "{SSHA}", 0, 6)) {
			digest = digest.substring (6); // ignore the label
	    }

	    BASE64Decoder base64 = new BASE64Decoder();
	    byte[][] hs = split (base64.decodeBuffer (digest), 20);
	    byte[] hash = hs[0];
	    byte[] salt = hs[1];

	    if (verbose) System.out.println ("  hash:"+toHex (hash) + " // " + toHex (salt));

		sha.reset();
		sha.update (compStr.getBytes());
		sha.update (salt);
		byte[] pwhash = sha.digest();
		if (verbose) System.out.println ("pwhash:"+toHex (pwhash));
		if (! sha.isEqual (hash, pwhash)) {
			System.out.println ("doesn't match: " + compStr);
			return false;
		} else {
			System.out.println ("matched: " + compStr);
			return true;
		}
	}

	//암호화	
	public String genSHA(String genStr, String saltStr, boolean verbose) 
		throws	java.io.IOException, java.security.NoSuchAlgorithmException { 

		sha = MessageDigest.getInstance ("SHA-1");
	    byte[] salt = {};
	    if (!saltStr.equals ("")) {
			salt = fromHex (saltStr);
			//if (verbose) System.out.println (toHex (salt));
	    }
	    String label = (salt.length > 0) ? "{SSHA}" : "{SHA}";
	    BASE64Encoder base64 = new BASE64Encoder();

		sha.reset();
		sha.update (genStr.getBytes());
		sha.update (salt);
		byte[] pwhash = sha.digest();
		//if (verbose) System.out.print (toHex (pwhash) + " ");
		//System.out.println ("Encode Result:"+label + "/" + base64.encode (concatenate (pwhash, salt)));
		return label + base64.encode (concatenate (pwhash, salt));
	}

    private static byte[] concatenate (byte[] l, byte[] r) {
		byte[] b = new byte [l.length + r.length];
		System.arraycopy (l, 0, b, 0, l.length);
		System.arraycopy (r, 0, b, l.length, r.length);
		return b;
    }

    private static byte[][] split (byte[] src, int n) {
		byte[] l, r;
		if (src.length <= n) {
		    l = src;
		    r = new byte[0];
		} else {
		    l = new byte[n];
		    r = new byte[src.length - n];
		    System.arraycopy (src, 0, l, 0, n);
		    System.arraycopy (src, n, r, 0, r.length);
		}
		byte[][] lr = {l, r};
		return lr;
    }

    private static String hexits = "0123456789abcdef";

    private static String toHex( byte[] block ) {
		StringBuffer buf = new StringBuffer();
		for ( int i = 0; i < block.length; ++i ) {
		    buf.append( hexits.charAt( ( block[i] >>> 4 ) & 0xf ) );
		    buf.append( hexits.charAt( block[i] & 0xf ) );
		}
		return buf + "";
    }

    private static byte[] fromHex( String s ) {
	s = s.toLowerCase();
	byte[] b = new byte [(s.length() + 1) / 2];
	int j = 0;
	int h;
	int nybble = -1;
	for (int i = 0; i < s.length(); ++i) {
	    h = hexits.indexOf (s.charAt(i));
	    if (h >= 0) {
		if (nybble < 0) {
		    nybble = h;
		} else {
		    b[j++] = (byte)((nybble << 4) + h);
		    nybble = -1;
		}
	    }
	}
	if (nybble >= 0) {
	    b[j++] = (byte)(nybble << 4);
	}
	if (j < b.length) {
	    byte[] b2 = new byte [j];
	    System.arraycopy (b, 0, b2, 0, j);
	    b = b2;
	}
	return b;
    }
}
