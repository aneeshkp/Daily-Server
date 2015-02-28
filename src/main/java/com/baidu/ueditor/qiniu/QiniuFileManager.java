package com.baidu.ueditor.qiniu;

import com.baidu.ueditor.PathFormat;
import com.baidu.ueditor.define.BaseState;
import com.baidu.ueditor.define.MultiState;
import com.baidu.ueditor.define.State;
import com.baidu.ueditor.hunter.FileManager;
import com.ng.daily.server.common.qiniu.QiniuService;
import com.ng.daily.server.common.util.SpringContextHolder;
import com.qiniu.api.rsf.ListItem;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by fangs on 15/2/28.
 */
public class QiniuFileManager extends FileManager {


    public QiniuFileManager(Map<String, Object> conf) {
        super(conf);
    }

    @Override
    public State listFile(int index) {
        State state = null;
        QiniuService qiniuService = SpringContextHolder.getBean(QiniuService.class);
        List<ListItem> all = qiniuService.listFiles(true);

        if (index < 0 || index > all.size()) {
            state = new MultiState(true);
        } else {
            Object[] fileList = Arrays.copyOfRange(all.toArray(), index, index + this.count);
            state = this.getState(fileList);
        }

        state.putInfo("start", index);
        state.putInfo("total", all.size());

        return state;
    }

    private State getState(Object[] files) {
        MultiState state = new MultiState(true);
        BaseState fileState = null;
        ListItem file = null;
        for (Object obj : files) {
            if (obj == null) {
                break;
            }
            file = (ListItem) obj;
            fileState = new BaseState(true);
            fileState.putInfo("url", PathFormat.format(file.key));
            state.addState(fileState);
        }
        return state;
    }


}
