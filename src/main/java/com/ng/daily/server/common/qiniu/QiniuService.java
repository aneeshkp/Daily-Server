package com.ng.daily.server.common.qiniu;

import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.PutPolicy;
import com.qiniu.api.rsf.ListItem;
import com.qiniu.api.rsf.ListPrefixRet;
import com.qiniu.api.rsf.RSFClient;
import com.qiniu.api.rsf.RSFEofException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
        String resultUrl;
        try {
            Config.ACCESS_KEY = ak;
            Config.SECRET_KEY = sk;
            Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
            PutPolicy putPolicy = new PutPolicy(bucketName);
            String uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
            PutRet ret = IoApi.putFile(uptoken, key, localFilePath, extra);
//            ret.getHash();
            resultUrl = domainName + key;
        } catch (AuthException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return resultUrl;
    }

    public List<ListItem> listFiles() {
        Config.ACCESS_KEY = ak;
        Config.SECRET_KEY = sk;
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);

        RSFClient client = new RSFClient(mac);
        String marker = "";

        List<ListItem> all = new ArrayList<ListItem>();
        ListPrefixRet ret = null;
        while (true) {
//            ret = client.listPrifix(bucketName, "<prifix>", marker, 10);
            ret = client.listPrifix(bucketName, "", marker, 10);

            marker = ret.marker;
            all.addAll(ret.results);
            if (!ret.ok()) {
                // no more items or error occurs
                break;
            }
        }
        if (ret.exception.getClass() != RSFEofException.class) {
            // error handler
        }

        for(ListItem item : all) {
            item.key = domainName + item.key;
        }

        return all;
    }


}
