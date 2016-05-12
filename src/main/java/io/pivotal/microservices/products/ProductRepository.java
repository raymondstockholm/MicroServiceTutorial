package io.pivotal.microservices.products;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

/**
 * Repository for Product data implemented using Spring Data JPA.
 * 
 * @author Raymond Stockholm (based on Paul Chapman)
 */
public interface ProductRepository extends Repository<Product, Long> {
	/**
	 * Find a product with the specified product name.
	 *
	 * @param name
	 * @return The product if found, null otherwise.
	 */
	public Product findByName(String name);

	/**
	 * Find products whose name contains the specified string
	 * 
	 * @param partialName
	 *            Any alphabetic string.
	 * @return The list of matching products - always non-null, but may be
	 *         empty.
	 */
	public List<Product> findByNameContainingIgnoreCase(String partialName);

	/**
	 * Fetch the number of products known to the system.
	 * 
	 * @return The number of products.
	 */
	@Query("SELECT count(*) from Product")
	public int countProducts();
}
