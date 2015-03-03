package com.ng.daily.server.common.pagination;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 翻页结果集封装类
 *
 */
public class Page<T> implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 6125607220473138916L;

    /**  */

    //每页最大记录数  
    public int pageMaxSize;

    //当前页记录数
    public int currentPageDataSize;

    // 翻页页面内容
    private List<T> dataList;
    // 总记录数
    public int totalSize;
    // 当前页码
    public int currentPageNumber;

    // 总页数。
    public int totalPageSize;

    //分页页面唯一标示
    private String _page_div;

    private String url;

    /**
     * 获取_page_div
     *
     * @return _page_div
     */
    public String get_page_div() {
        return _page_div;
    }

    /**
     * 设置_page_div
     *
     * @param _page_div _page_div
     */
    public void set_page_div(String _page_div) {
        this._page_div = _page_div;
    }

    /**
     * 获取totalPageSize
     *
     * @return totalPageSize
     */
    public int getTotalPageSize() {
        return totalPageSize;
    }

    /**
     * 设置totalPageSize
     *
     * @param totalPageSize totalPageSize
     */
    public void setTotalPageSize(int totalPageSize) {
        this.totalPageSize = totalPageSize;
    }

    /**
     * 获取currentPageNumber
     *
     * @return currentPageNumber
     */
    public int getCurrentPageNumber() {
        return currentPageNumber;
    }

    /**
     * 获取currentPageDataSize
     *
     * @return currentPageDataSize
     */
    public int getCurrentPageDataSize() {
        return currentPageDataSize;
    }

    /**
     * 设置currentPageDataSize
     *
     * @param currentPageDataSize currentPageDataSize
     */
    public void setCurrentPageDataSize(int currentPageDataSize) {
        this.currentPageDataSize = currentPageDataSize;
    }

    /**
     * 获取pageMaxSize
     *
     * @return pageMaxSize
     */
    public int getPageMaxSize() {
        return pageMaxSize;
    }

    /**
     * 设置pageMaxSize
     *
     * @param pageMaxSize pageMaxSize
     */
    public void setPageMaxSize(int pageMaxSize) {
        this.pageMaxSize = pageMaxSize;
    }

    /**
     * 设置currentPageNumber
     *
     * @param currentPageNumber currentPageNumber
     */
    public void setCurrentPageNumber(int currentPageNumber) {
        this.currentPageNumber = currentPageNumber;
    }

    public Page() {
        this(0, 1, new ArrayList(), 0, null);
    }

    /**
     * 初始化page信息
     *
     * @param currentPageNumber 当前页码
     * @param pageMaxSize       每页最大记录数
     * @param dataList          数据集
     * @param totalSize         总记录数
     */
    public Page(int currentPageNumber, int pageMaxSize, List<T> dataList,
                int totalSize, String _page_div) {
        super();
        this.pageMaxSize = pageMaxSize;
        this.dataList = java.util.Collections.unmodifiableList(dataList);
        this.totalSize = totalSize;
        this.currentPageNumber = currentPageNumber;
        this.currentPageDataSize = this.dataList.size();
        this.totalPageSize = totalSize / pageMaxSize + ((totalSize % pageMaxSize) == 0 ? 0 : 1);
        this._page_div = _page_div;
    }


    public Page(List<T> dataList) {
        this.dataList = dataList;
    }

    /**
     * @return 返回预置的每页数据条数。
     */
    public int getPageSize() {
        return pageMaxSize;
    }

    /**
     * @return 返回数据列表。
     */
    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }

    /**
     * @return 返回总条数。
     */
    public long getTotalSize() {
        return totalSize;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

}
