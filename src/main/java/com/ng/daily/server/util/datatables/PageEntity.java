package com.ng.daily.server.util.datatables;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.io.Serializable;
import java.util.List;

/**
 * DataTables 响应封装
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class PageEntity<T> implements Serializable {

    /**
     *
     */
    private int sEcho;

    /**
     * @see org.springframework.data.domain.Page#getNumberOfElements()
     */
    private int iTotalRecords;

    /**
     *
     */
    private long iTotalDisplayRecords;

    /**
     * 响应数据
     *
     * @see org.springframework.data.domain.Page#getContent()
     */
    private List<T> aaData;

    public List<T> getAaData() {
        return aaData;
    }

    public void setAaData(List<T> aaData) {
        this.aaData = aaData;
    }

    public PageEntity(int draw, int iTotalRecords, long iTotalDisplayRecords, List<T> data) {
        this.sEcho = draw;
        this.iTotalRecords = iTotalRecords;
        this.iTotalDisplayRecords = iTotalDisplayRecords;
        this.aaData = data;
    }

    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }

    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public long getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(long iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PageEntity that = (PageEntity) o;

        if (sEcho != that.sEcho) return false;
        if (iTotalDisplayRecords != that.iTotalDisplayRecords) return false;
        if (iTotalRecords != that.iTotalRecords) return false;
        if (aaData != null ? !aaData.equals(that.aaData) : that.aaData != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = sEcho;
        result = 31 * result + iTotalRecords;
        result = 31 * result + (int) (iTotalDisplayRecords ^ (iTotalDisplayRecords >>> 32));
        result = 31 * result + (aaData != null ? aaData.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return String.format("[The current draw is %s with %s recordsTotal and %s recordsFiltered]" +
                        " [The current received data is %s",
                sEcho, iTotalRecords, iTotalDisplayRecords, aaData.toString());
    }


}
