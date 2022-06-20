package fisciano;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.crypto.spec.SecretKeySpec;

public class MD5 {
	@SuppressWarnings("static-access")
	public static void main(String[] args) {
		Encryption e=new Encryption();
		
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

}
