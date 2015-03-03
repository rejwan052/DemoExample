package info.diit.persistence.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.validation.constraints.NotNull;

@Entity
public class Image implements Serializable {

    private static final long serialVersionUID = -8613484747022876124L;

    @Id
    private Long id;

    @Basic(fetch=FetchType.LAZY)
    @Lob
    @NotNull
    private byte[] data;

    @NotNull
    private String contentType;

    @Column
    @NotNull
    private Date createDate;

    @Basic(fetch=FetchType.LAZY)
    @Lob
    @Column
    private byte[] thumbnail;
    
	private Date updateDate;
	private String updatedBy;
	
    
    public Image(byte[] data) {
        setData(data);
    }
    
    public Image() {}

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public byte[] getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(byte[] thumbnail) {
        this.thumbnail = thumbnail;
    }

  

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
    
    
    
}
