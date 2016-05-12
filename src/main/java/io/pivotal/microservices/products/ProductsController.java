package io.pivotal.microservices.products;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * A RESTFul controller for accessing product information.
 * 
 * @author Raymond Stockholm (based on Paul Chapman)
 */
@RestController
public class ProductsController {

	protected Logger logger = Logger.getLogger(ProductsController.class
			.getName());
	protected ProductRepository productRepository;

	/**
	 * Create an instance plugging in the respository of Products.
	 * 
	 * @param productRepository
	 *            A product repository implementation.
	 */
	@Autowired
	public ProductsController(ProductRepository productRepository) {
		this.productRepository = productRepository;

		logger.info("AccountRepository says system has "
				+ productRepository.countProducts() + " products");
	}

	/**
	 * Fetch a product with the specified product name.
	 * 
	 * @param productName
	 *            A String.
	 * @return The product if found.
	 * @throws ProductNotFoundException
	 *             If the String is not recognized.
	 */
	@RequestMapping("/products/{productName}")
	public Product byNumber(@PathVariable("productName") String productName) {

		logger.info("products-service byName() invoked: " + productName);
		Product product = productRepository.findByName(productName);
		logger.info("products-service byName() found: " + product);

		if (product == null)
			throw new ProductNotFoundException(productName);
		else {
			return product;
		}
	}

	/**
	 * Fetch products with the specified name. A partial case-insensitive match
	 * is supported. So <code>http://.../products/name/livret</code> will find any
	 * products with upper or lower case 'livret' in their name.
	 * 
	 * @param partialName
	 * @return A non-null, non-empty set of accounts.
	 * @throws AccountNotFoundException
	 *             If there are no matches at all.
	 */
	@RequestMapping("/products/name/{name}")
	public List<Product> byOwner(@PathVariable("name") String partialName) {
		logger.info("products-service byOwner() invoked: "
				+ productRepository.getClass().getName() + " for "
				+ partialName);

		List<Product> products = productRepository
				.findByNameContainingIgnoreCase(partialName);
		logger.info("products-service byName() found: " + products);

		if (products == null || products.size() == 0)
			throw new ProductNotFoundException(partialName);
		else {
			return products;
		}
	}
}
