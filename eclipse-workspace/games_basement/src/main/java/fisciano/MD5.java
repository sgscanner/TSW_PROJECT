package fisciano;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.GeneralSecurityException;
import java.util.Random;

import javax.crypto.spec.SecretKeySpec;

public class MD5 {
	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		Encryption e=new Encryption();
		
		System.out.println("Rand string:"+rand(15));
		try {
			String originalPassword = "password";
			 byte[] salt = new String("12345678").getBytes();
			 SecretKeySpec key = e.createSecretKey("password".toCharArray(),salt, 40000, 128);
			System.out.println("Original password: " + originalPassword);
			String encryptedPassword = e.encrypt(originalPassword, key);
			System.out.println("Encrypted password: " + encryptedPassword);
			String decryptedPassword = e.decrypt(encryptedPassword,  key);
			System.out.println("Decrypted password: " + decryptedPassword);
		}catch( GeneralSecurityException | IOException e2) {
			
		}
	}

	public static String rand(int i) {
		 byte[] bytearray;
	        String mystring;
	        StringBuffer thebuffer;
	        
	        bytearray = new byte[256]; 
	        new Random().nextBytes(bytearray); 

	        mystring 
	            = new String(bytearray, Charset.forName("UTF-8")); 

	        // Create the StringBuffer
	        thebuffer = new StringBuffer(); 

	        for (int m = 0; m < mystring.length(); m++) { 

	            char n = mystring.charAt(m); 

	            if (((n >= 'A' && n <= 'Z') 
	                || (n >= '0' && n <= '9')) 
	                && (i > 0)) { 

	                thebuffer.append(n); 
	                i--; 
	            } 
	        } 

	        // resulting string 
	        return thebuffer.toString(); 
	}
}
