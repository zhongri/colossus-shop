package com.colossus.common.model;

import java.io.Serializable;
import java.util.Date;

public class Order implements Serializable {
    /**
     * 订单id
     *
     * @mbg.generated
     */
    private String id;

    /**
     * 用户id
     *
     * @mbg.generated
     */
    private Long userId;

    /**
     * 地址id
     *
     * @mbg.generated
     */
    private Long addrId;

    /**
     * 实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分
     *
     * @mbg.generated
     */
    private String payment;

    /**
     * 支付类型，1、货到付款，2、在线支付，3、微信支付，4、支付宝支付
     *
     * @mbg.generated
     */
    private Integer paymentType;

    /**
     * 邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分
     *
     * @mbg.generated
     */
    private String postFee;

    /**
     * 状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭
     *
     * @mbg.generated
     */
    private Integer status;

    /**
     * 物流名称
     *
     * @mbg.generated
     */
    private String shippingName;

    /**
     * 物流单号
     *
     * @mbg.generated
     */
    private String shippingCode;

    /**
     * 退换无忧
     *
     * @mbg.generated
     */
    private String noAnnoyance;

    /**
     * 服务费
     *
     * @mbg.generated
     */
    private String servicePrice;

    /**
     * 返现
     *
     * @mbg.generated
     */
    private String returnPrice;

    /**
     * 订单总重 单位/克
     *
     * @mbg.generated
     */
    private String totalWeight;

    /**
     * 买家是否已经评价
     *
     * @mbg.generated
     */
    private Integer buyerRate;

    /**
     * 交易关闭时间
     *
     * @mbg.generated
     */
    private Date closeTime;

    /**
     * 交易完成时间
     *
     * @mbg.generated
     */
    private Date endTime;

    /**
     * 付款时间
     *
     * @mbg.generated
     */
    private Date paymentTime;

    /**
     * 发货时间
     *
     * @mbg.generated
     */
    private Date consignTime;

    /**
     * 订单创建时间
     *
     * @mbg.generated
     */
    private Date createTime;

    /**
     * 订单更新时间
     *
     * @mbg.generated
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getAddrId() {
        return addrId;
    }

    public void setAddrId(Long addrId) {
        this.addrId = addrId;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Integer getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(Integer paymentType) {
        this.paymentType = paymentType;
    }

    public String getPostFee() {
        return postFee;
    }

    public void setPostFee(String postFee) {
        this.postFee = postFee;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getShippingName() {
        return shippingName;
    }

    public void setShippingName(String shippingName) {
        this.shippingName = shippingName;
    }

    public String getShippingCode() {
        return shippingCode;
    }

    public void setShippingCode(String shippingCode) {
        this.shippingCode = shippingCode;
    }

    public String getNoAnnoyance() {
        return noAnnoyance;
    }

    public void setNoAnnoyance(String noAnnoyance) {
        this.noAnnoyance = noAnnoyance;
    }

    public String getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(String servicePrice) {
        this.servicePrice = servicePrice;
    }

    public String getReturnPrice() {
        return returnPrice;
    }

    public void setReturnPrice(String returnPrice) {
        this.returnPrice = returnPrice;
    }

    public String getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(String totalWeight) {
        this.totalWeight = totalWeight;
    }

    public Integer getBuyerRate() {
        return buyerRate;
    }

    public void setBuyerRate(Integer buyerRate) {
        this.buyerRate = buyerRate;
    }

    public Date getCloseTime() {
        return closeTime;
    }

    public void setCloseTime(Date closeTime) {
        this.closeTime = closeTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getConsignTime() {
        return consignTime;
    }

    public void setConsignTime(Date consignTime) {
        this.consignTime = consignTime;
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
        sb.append(", userId=").append(userId);
        sb.append(", addrId=").append(addrId);
        sb.append(", payment=").append(payment);
        sb.append(", paymentType=").append(paymentType);
        sb.append(", postFee=").append(postFee);
        sb.append(", status=").append(status);
        sb.append(", shippingName=").append(shippingName);
        sb.append(", shippingCode=").append(shippingCode);
        sb.append(", noAnnoyance=").append(noAnnoyance);
        sb.append(", servicePrice=").append(servicePrice);
        sb.append(", returnPrice=").append(returnPrice);
        sb.append(", totalWeight=").append(totalWeight);
        sb.append(", buyerRate=").append(buyerRate);
        sb.append(", closeTime=").append(closeTime);
        sb.append(", endTime=").append(endTime);
        sb.append(", paymentTime=").append(paymentTime);
        sb.append(", consignTime=").append(consignTime);
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
        Order other = (Order) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
            && (this.getAddrId() == null ? other.getAddrId() == null : this.getAddrId().equals(other.getAddrId()))
            && (this.getPayment() == null ? other.getPayment() == null : this.getPayment().equals(other.getPayment()))
            && (this.getPaymentType() == null ? other.getPaymentType() == null : this.getPaymentType().equals(other.getPaymentType()))
            && (this.getPostFee() == null ? other.getPostFee() == null : this.getPostFee().equals(other.getPostFee()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getShippingName() == null ? other.getShippingName() == null : this.getShippingName().equals(other.getShippingName()))
            && (this.getShippingCode() == null ? other.getShippingCode() == null : this.getShippingCode().equals(other.getShippingCode()))
            && (this.getNoAnnoyance() == null ? other.getNoAnnoyance() == null : this.getNoAnnoyance().equals(other.getNoAnnoyance()))
            && (this.getServicePrice() == null ? other.getServicePrice() == null : this.getServicePrice().equals(other.getServicePrice()))
            && (this.getReturnPrice() == null ? other.getReturnPrice() == null : this.getReturnPrice().equals(other.getReturnPrice()))
            && (this.getTotalWeight() == null ? other.getTotalWeight() == null : this.getTotalWeight().equals(other.getTotalWeight()))
            && (this.getBuyerRate() == null ? other.getBuyerRate() == null : this.getBuyerRate().equals(other.getBuyerRate()))
            && (this.getCloseTime() == null ? other.getCloseTime() == null : this.getCloseTime().equals(other.getCloseTime()))
            && (this.getEndTime() == null ? other.getEndTime() == null : this.getEndTime().equals(other.getEndTime()))
            && (this.getPaymentTime() == null ? other.getPaymentTime() == null : this.getPaymentTime().equals(other.getPaymentTime()))
            && (this.getConsignTime() == null ? other.getConsignTime() == null : this.getConsignTime().equals(other.getConsignTime()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getAddrId() == null) ? 0 : getAddrId().hashCode());
        result = prime * result + ((getPayment() == null) ? 0 : getPayment().hashCode());
        result = prime * result + ((getPaymentType() == null) ? 0 : getPaymentType().hashCode());
        result = prime * result + ((getPostFee() == null) ? 0 : getPostFee().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getShippingName() == null) ? 0 : getShippingName().hashCode());
        result = prime * result + ((getShippingCode() == null) ? 0 : getShippingCode().hashCode());
        result = prime * result + ((getNoAnnoyance() == null) ? 0 : getNoAnnoyance().hashCode());
        result = prime * result + ((getServicePrice() == null) ? 0 : getServicePrice().hashCode());
        result = prime * result + ((getReturnPrice() == null) ? 0 : getReturnPrice().hashCode());
        result = prime * result + ((getTotalWeight() == null) ? 0 : getTotalWeight().hashCode());
        result = prime * result + ((getBuyerRate() == null) ? 0 : getBuyerRate().hashCode());
        result = prime * result + ((getCloseTime() == null) ? 0 : getCloseTime().hashCode());
        result = prime * result + ((getEndTime() == null) ? 0 : getEndTime().hashCode());
        result = prime * result + ((getPaymentTime() == null) ? 0 : getPaymentTime().hashCode());
        result = prime * result + ((getConsignTime() == null) ? 0 : getConsignTime().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }
}