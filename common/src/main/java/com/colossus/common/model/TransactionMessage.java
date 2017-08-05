package com.colossus.common.model;

import java.io.Serializable;
import java.util.Date;

public class TransactionMessage implements Serializable {
    /**
     * 主键ID
     *
     * @mbg.generated
     */
    private String id;

    /**
     * 版本号
     *
     * @mbg.generated
     */
    private Integer version;

    /**
     * 修改者
     *
     * @mbg.generated
     */
    private String editor;

    /**
     * 创建者
     *
     * @mbg.generated
     */
    private String creater;

    /**
     * 最后修改时间
     *
     * @mbg.generated
     */
    private Date editTime;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    private Date createTime;

    /**
     * 消息ID
     *
     * @mbg.generated
     */
    private String messageId;

    /**
     * 消息数据类型
     *
     * @mbg.generated
     */
    private String messageDataType;

    /**
     * 消费队列
     *
     * @mbg.generated
     */
    private String consumerQueue;

    /**
     * 消息重发次数
     *
     * @mbg.generated
     */
    private Short messageSendTimes;

    /**
     * 是否死亡
     *
     * @mbg.generated
     */
    private String areadlyDead;

    /**
     * 状态
     *
     * @mbg.generated
     */
    private String status;

    /**
     * 备注
     *
     * @mbg.generated
     */
    private String remark;

    /**
     * 扩展字段1
     *
     * @mbg.generated
     */
    private String field1;

    /**
     * 扩展字段2
     *
     * @mbg.generated
     */
    private String field2;

    /**
     * 扩展字段3
     *
     * @mbg.generated
     */
    private String field3;

    private Date updateTime;

    /**
     * 消息内容
     *
     * @mbg.generated
     */
    private String messageBody;

    private static final long serialVersionUID = 1L;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    public String getCreater() {
        return creater;
    }

    public void setCreater(String creater) {
        this.creater = creater;
    }

    public Date getEditTime() {
        return editTime;
    }

    public void setEditTime(Date editTime) {
        this.editTime = editTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getMessageId() {
        return messageId;
    }

    public void setMessageId(String messageId) {
        this.messageId = messageId;
    }

    public String getMessageDataType() {
        return messageDataType;
    }

    public void setMessageDataType(String messageDataType) {
        this.messageDataType = messageDataType;
    }

    public String getConsumerQueue() {
        return consumerQueue;
    }

    public void setConsumerQueue(String consumerQueue) {
        this.consumerQueue = consumerQueue;
    }

    public Short getMessageSendTimes() {
        return messageSendTimes;
    }

    public void setMessageSendTimes(Short messageSendTimes) {
        this.messageSendTimes = messageSendTimes;
    }

    public String getAreadlyDead() {
        return areadlyDead;
    }

    public void setAreadlyDead(String areadlyDead) {
        this.areadlyDead = areadlyDead;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
        this.field1 = field1;
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
        this.field2 = field2;
    }

    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
        this.field3 = field3;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", version=").append(version);
        sb.append(", editor=").append(editor);
        sb.append(", creater=").append(creater);
        sb.append(", editTime=").append(editTime);
        sb.append(", createTime=").append(createTime);
        sb.append(", messageId=").append(messageId);
        sb.append(", messageDataType=").append(messageDataType);
        sb.append(", consumerQueue=").append(consumerQueue);
        sb.append(", messageSendTimes=").append(messageSendTimes);
        sb.append(", areadlyDead=").append(areadlyDead);
        sb.append(", status=").append(status);
        sb.append(", remark=").append(remark);
        sb.append(", field1=").append(field1);
        sb.append(", field2=").append(field2);
        sb.append(", field3=").append(field3);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", messageBody=").append(messageBody);
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
        TransactionMessage other = (TransactionMessage) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getVersion() == null ? other.getVersion() == null : this.getVersion().equals(other.getVersion()))
            && (this.getEditor() == null ? other.getEditor() == null : this.getEditor().equals(other.getEditor()))
            && (this.getCreater() == null ? other.getCreater() == null : this.getCreater().equals(other.getCreater()))
            && (this.getEditTime() == null ? other.getEditTime() == null : this.getEditTime().equals(other.getEditTime()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getMessageId() == null ? other.getMessageId() == null : this.getMessageId().equals(other.getMessageId()))
            && (this.getMessageDataType() == null ? other.getMessageDataType() == null : this.getMessageDataType().equals(other.getMessageDataType()))
            && (this.getConsumerQueue() == null ? other.getConsumerQueue() == null : this.getConsumerQueue().equals(other.getConsumerQueue()))
            && (this.getMessageSendTimes() == null ? other.getMessageSendTimes() == null : this.getMessageSendTimes().equals(other.getMessageSendTimes()))
            && (this.getAreadlyDead() == null ? other.getAreadlyDead() == null : this.getAreadlyDead().equals(other.getAreadlyDead()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
            && (this.getField1() == null ? other.getField1() == null : this.getField1().equals(other.getField1()))
            && (this.getField2() == null ? other.getField2() == null : this.getField2().equals(other.getField2()))
            && (this.getField3() == null ? other.getField3() == null : this.getField3().equals(other.getField3()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()))
            && (this.getMessageBody() == null ? other.getMessageBody() == null : this.getMessageBody().equals(other.getMessageBody()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getVersion() == null) ? 0 : getVersion().hashCode());
        result = prime * result + ((getEditor() == null) ? 0 : getEditor().hashCode());
        result = prime * result + ((getCreater() == null) ? 0 : getCreater().hashCode());
        result = prime * result + ((getEditTime() == null) ? 0 : getEditTime().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getMessageId() == null) ? 0 : getMessageId().hashCode());
        result = prime * result + ((getMessageDataType() == null) ? 0 : getMessageDataType().hashCode());
        result = prime * result + ((getConsumerQueue() == null) ? 0 : getConsumerQueue().hashCode());
        result = prime * result + ((getMessageSendTimes() == null) ? 0 : getMessageSendTimes().hashCode());
        result = prime * result + ((getAreadlyDead() == null) ? 0 : getAreadlyDead().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getField1() == null) ? 0 : getField1().hashCode());
        result = prime * result + ((getField2() == null) ? 0 : getField2().hashCode());
        result = prime * result + ((getField3() == null) ? 0 : getField3().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        result = prime * result + ((getMessageBody() == null) ? 0 : getMessageBody().hashCode());
        return result;
    }
}