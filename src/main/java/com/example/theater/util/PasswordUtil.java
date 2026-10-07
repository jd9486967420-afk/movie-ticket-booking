package com.example.theater.util;
import java.security.*; import java.util.*; import javax.crypto.SecretKeyFactory; import javax.crypto.spec.PBEKeySpec;
public final class PasswordUtil {
 private PasswordUtil(){}
 public static String hash(String password) {
  try { byte[] salt=new byte[16]; new SecureRandom().nextBytes(salt); int it=120000;
   byte[] out=SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256").generateSecret(new PBEKeySpec(password.toCharArray(),salt,it,256)).getEncoded();
   return "PBKDF2$"+it+"$"+Base64.getEncoder().encodeToString(salt)+"$"+Base64.getEncoder().encodeToString(out);
  } catch(Exception e){throw new IllegalStateException(e);}
 }
 public static boolean verify(String password,String stored){
  try {String[] p=stored.split("\$"); if(p.length!=4)return false; int it=Integer.parseInt(p[1]);
   byte[] salt=Base64.getDecoder().decode(p[2]), expected=Base64.getDecoder().decode(p[3]);
   byte[] actual=SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256").generateSecret(new PBEKeySpec(password.toCharArray(),salt,it,256)).getEncoded();
   return MessageDigest.isEqual(expected,actual);
  }catch(Exception e){return false;}
 }
}
