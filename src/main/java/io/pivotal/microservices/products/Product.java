package io.pivotal.microservices.products;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Persistent product entity with JPA markup. Products are stored in an H2
 * relational database.
 * 
 * @author Raymond Stockholm (based on Paul Chapman)
 */
@Entity
@Table(name = "T_PRODUCT")
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;

	public static Long nextId = 0L;

	@Id
	protected Long id;
	
	protected int ceiling;

	@Column(name = "name")
	protected String name;

	protected static Long getNextId() {
		synchronized (nextId) {
			return nextId++;
		}
	}

	/**
	 * Default constructor for JPA only.
	 */
	protected Product() {
	}

	public Product(String number, String owner) {
		id = getNextId();
		ceiling = 0;
	}

	public long getId() {
		return id;
	}

	/**
	 * Set JPA id - for testing and JPA only. Not intended for normal use.
	 * 
	 * @param id
	 *            The new id.
	 */
	protected void setId(long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}

	protected void setName(String n) {
		this.name = n;
	}

	public int getCeiling() {
		return ceiling;
	}

	public void setCeiling(int ceiling) {
		this.ceiling = ceiling;
	}


	@Override
	public String toString() {
		return name + " [" + ceiling + "]";
	}

}
