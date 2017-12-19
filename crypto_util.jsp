<%@ page import = "javax.crypto.*, java.security.*, java.util.Arrays, javax.crypto.spec.SecretKeySpec, java.io.IOException, java.util.Base64" %>
<%

class CryptoUtils {


    public String doEncrypt(String type, String encodekey, String inputStr) {
        try {

            Cipher cipher = Cipher.getInstance(type);

            byte[] key = encodekey.getBytes("UTF-8");
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            key = sha.digest(key);
            key = Arrays.copyOf(key, 16); // use only first 128 bit

            SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");

            cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);

            byte[] inputBytes = inputStr.getBytes();     
            byte[] outputBytes = cipher.doFinal(inputBytes);

            return Base64.getEncoder().encodeToString(outputBytes);

        } catch (NoSuchPaddingException | NoSuchAlgorithmException
                | InvalidKeyException | BadPaddingException
                | IllegalBlockSizeException | IOException ex) {
            
       }
       return null;
     }


    public String doDecrypt(String type, String encodekey,String encrptedStr) { 
          try {     

              Cipher dcipher = Cipher.getInstance(type);
              byte[] key = encodekey.getBytes("UTF-8");
              MessageDigest sha = MessageDigest.getInstance("SHA-1");
              key = sha.digest(key);
              key = Arrays.copyOf(key, 16); // use only first 128 bit

              SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");

              dcipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
            // decode with base64 to get bytes

              byte[] dec = Base64.getDecoder().decode(encrptedStr.getBytes());  
              byte[] utf8 = dcipher.doFinal(dec);

              // create new string based on the specified charset
              return new String(utf8, "UTF8");

          } catch (Exception e) {
            e.printStackTrace();

          }
      return null;
      }
 }
 CryptoUtils util = new CryptoUtils();

String cipherType = request.getParameter("cipher");
String message = request.getParameter("message");
String key = request.getParameter("key");
String encryptTo = request.getParameter("encrypt");

if (encryptTo != null) {
 out.print(util.doEncrypt(cipherType, message, key));
 session.setAttribute("lastMessage", message);
} else {
  String lastMessage = (String) session.getAttribute("lastMessage");
  if (lastMessage != null) {
  out.print(lastMessage);
  } else {
    String dd = util.doDecrypt(cipherType, message, key);
    if (dd == null) {
       out.print(util.doEncrypt(cipherType, message, key));
    }else {
      out.print(dd);
    }
   }
  

 
  
}


%>