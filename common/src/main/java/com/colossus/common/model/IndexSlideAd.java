package com.colossus.common.model;

import java.io.Serializable;
import java.util.Date;

public class IndexSlideAd implements Serializable {
    /**
     * ID
     *
     * @mbg.generated
     */
    private String id;

    /**
     * 提示
     *
     * @mbg.generated
     */
    private String alt;

    /**
     * log号
     *
     * @mbg.generated
     */
    private String clog;

    /**
     * 无
     *
     * @mbg.generated
     */
    private String ext1;

    /**
     * 网址
     *
     * @mbg.generated
     */
    private String href;

    /**
     * log等级
     *
     * @mbg.generated
     */
    private String logv;

    /**
     * 大图片
     *
     * @mbg.generated
     */
    private String src;

    /**
     * 小图片
     *
     * @mbg.generated
     */
    private String srcb;

    /**
     * 状态。可选值:1(正常),2(删除)
     *
     * @mbg.generated
     */
    private Integer status;

    /**
     * 排序
     *
     * @mbg.generated
     */
    private Integer sortOrder;

    /**
     * log记录网址前缀
     *
     * @mbg.generated
     */
    private String logdomain;

    private Date createTime;

    private Date updateTime;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public String getClog() {
        return clog;
    }

    public void setClog(String clog) {
        this.clog = clog;
    }

    public String getExt1() {
        return ext1;
    }

    public void setExt1(String ext1) {
        this.ext1 = ext1;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getLogv() {
        return logv;
    }

    public void setLogv(String logv) {
        this.logv = logv;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getSrcb() {
        return srcb;
    }

    public void setSrcb(String srcb) {
        this.srcb = srcb;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public String getLogdomain() {
        return logdomain;
    }

    public void setLogdomain(String logdomain) {
        this.logdomain = logdomain;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", alt=").append(alt);
        sb.append(", clog=").append(clog);
        sb.append(", ext1=").append(ext1);
        sb.append(", href=").append(href);
        sb.append(", logv=").append(logv);
        sb.append(", src=").append(src);
        sb.append(", srcb=").append(srcb);
        sb.append(", status=").append(status);
        sb.append(", sortOrder=").append(sortOrder);
        sb.append(", logdomain=").append(logdomain);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append("]");
        return sb.toString();
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        IndexSlideAd other = (IndexSlideAd) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getAlt() == null ? other.getAlt() == null : this.getAlt().equals(other.getAlt()))
            && (this.getClog() == null ? other.getClog() == null : this.getClog().equals(other.getClog()))
            && (this.getExt1() == null ? other.getExt1() == null : this.getExt1().equals(other.getExt1()))
            && (this.getHref() == null ? other.getHref() == null : this.getHref().equals(other.getHref()))
            && (this.getLogv() == null ? other.getLogv() == null : this.getLogv().equals(other.getLogv()))
            && (this.getSrc() == null ? other.getSrc() == null : this.getSrc().equals(other.getSrc()))
            && (this.getSrcb() == null ? other.getSrcb() == null : this.getSrcb().equals(other.getSrcb()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getSortOrder() == null ? other.getSortOrder() == null : this.getSortOrder().equals(other.getSortOrder()))
            && (this.getLogdomain() == null ? other.getLogdomain() == null : this.getLogdomain().equals(other.getLogdomain()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getAlt() == null) ? 0 : getAlt().hashCode());
        result = prime * result + ((getClog() == null) ? 0 : getClog().hashCode());
        result = prime * result + ((getExt1() == null) ? 0 : getExt1().hashCode());
        result = prime * result + ((getHref() == null) ? 0 : getHref().hashCode());
        result = prime * result + ((getLogv() == null) ? 0 : getLogv().hashCode());
        result = prime * result + ((getSrc() == null) ? 0 : getSrc().hashCode());
        result = prime * result + ((getSrcb() == null) ? 0 : getSrcb().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getSortOrder() == null) ? 0 : getSortOrder().hashCode());
        result = prime * result + ((getLogdomain() == null) ? 0 : getLogdomain().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }
}