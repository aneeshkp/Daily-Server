package com.ng.daily.server.common.qiniu;

import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

/**
 * Created by fangs on 15/2/12.
 */
@Service
public class QiniuService {

    @Value("${qiniu.ak}")
    private String ak;
    @Value("${qiniu.sk}")
    private String sk;
    @Value("${qiniu.bucket.name}")
    private String bucketName;
    @Value("${qiniu.domain}")
    private String domainName;

    public String uploadFile(String localFilePath, String key) {
        String resultUrl = "";
        try {
            Config.ACCESS_KEY = ak;
            Config.SECRET_KEY = sk;
            Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
            PutPolicy putPolicy = new PutPolicy(bucketName);
            String uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
//            String key = String.valueOf(System.currentTimeMillis());
//            String localFile = "/Users/fangs/Pictures/drunk.jpg";
            PutRet ret = IoApi.putFile(uptoken, key, localFilePath, extra);
//            System.out.println(ret);
            resultUrl = domainName + key;
        } catch (AuthException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return resultUrl;
    }


}
