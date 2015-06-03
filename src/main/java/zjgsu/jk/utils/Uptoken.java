package zjgsu.jk.utils;

import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.rs.PutPolicy;

public class Uptoken {
	     
    private static String uptoken = null;
    static{
        try {
        	String ak = "bpM7UmlmL_NC4JGESxjxaKaciEY_EdglXHDhUKW0";
            String sk = "-T4cMtrLtlLW6WJMDJDNkxuPWeIVCPNLun_93gw9";
            String bucket = "jkweb";
            uptoken = new PutPolicy(bucket).token(new Mac(ak, sk));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static String getUptoken(){
    	return uptoken;
    }
}
