package com.ng.daily.server.common.qiniu;

import com.ng.daily.server.common.util.HttpClientManager;
import com.qiniu.api.auth.AuthException;
import com.qiniu.api.auth.digest.Mac;
import com.qiniu.api.config.Config;
import com.qiniu.api.io.IoApi;
import com.qiniu.api.io.PutExtra;
import com.qiniu.api.io.PutRet;
import com.qiniu.api.rs.BatchCallRet;
import com.qiniu.api.rs.EntryPath;
import com.qiniu.api.rs.PutPolicy;
import com.qiniu.api.rs.RSClient;
import com.qiniu.api.rsf.ListItem;
import com.qiniu.api.rsf.ListPrefixRet;
import com.qiniu.api.rsf.RSFClient;
import com.qiniu.api.rsf.RSFEofException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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

    @Autowired
    private HttpClientManager httpClientManager;

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


    public String uploadWithURL(String fileUrl, String key) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        httpClientManager.httpGet(fileUrl, out);
        InputStream in = new ByteArrayInputStream(out.toByteArray());
        return upload(in, key);
    }

    public String upload(InputStream inputStream, String key) {
        String resultUrl;
        try {
            Config.ACCESS_KEY = ak;
            Config.SECRET_KEY = sk;
            Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);
            PutPolicy putPolicy = new PutPolicy(bucketName);
            String uptoken = putPolicy.token(mac);
            PutExtra extra = new PutExtra();
            PutRet ret = IoApi.Put(uptoken, key, inputStream, extra);
//            ret.getHash();
            resultUrl = domainName + key;
        } catch (AuthException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
        return resultUrl;
    }


    public List<ListItem> listFiles(boolean fixKey) {
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

        if (fixKey) {
            for (ListItem item : all) {
                item.key = domainName + item.key;
            }
        }

        return all;
    }


    public void deleteAll() {

        Config.ACCESS_KEY = ak;
        Config.SECRET_KEY = sk;
        Mac mac = new Mac(Config.ACCESS_KEY, Config.SECRET_KEY);

        RSClient rs = new RSClient(mac);
        List<EntryPath> entries = new ArrayList<EntryPath>();

        List<ListItem> list = listFiles(false);

        System.err.println(list.size());
        for (ListItem item : list) {
            EntryPath e1 = new EntryPath();
            e1.bucket = bucketName;
            e1.key = item.key;
            entries.add(e1);
            System.err.println(item.key);
        }
        if (entries.size() > 0) {
            BatchCallRet bret = rs.batchDelete(entries);
        }


    }

}
