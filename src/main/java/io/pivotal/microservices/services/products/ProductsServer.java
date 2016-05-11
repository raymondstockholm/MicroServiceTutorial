package io.pivotal.microservices.services.products;

import io.pivotal.microservices.products.ProductRepository;
import io.pivotal.microservices.products.ProductsWebApplication;

import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.Import;

/**
 * Run as a micro-service, registering with the Discovery Server (Eureka).
 * <p>
 * Note that the configuration for this application is imported from
 * {@link ProductsWebApplication}. This is a deliberate separation of concerns
 * and allows the application to run:
 * <ul>
 * <li>Standalone - by executing {@link ProductsWebApplication#main(String[])}</li>
 * <li>As a microservice - by executing {@link ProductsServer#main(String[])}</li>
 * </ul>
 * 
 * @author Raymond Stockholm (based on Paul Chapman)
 */
@EnableAutoConfiguration
@EnableDiscoveryClient
@Import(ProductsWebApplication.class)
public class ProductsServer {

	@Autowired
	protected ProductRepository productRepository;

	protected Logger logger = Logger.getLogger(ProductsServer.class.getName());

	/**
	 * Run the application using Spring Boot and an embedded servlet engine.
	 * 
	 * @param args
	 *            Program arguments - ignored.
	 */
	public static void main(String[] args) {
		// Tell server to look for accounts-server.properties or
		// accounts-server.yml
		System.setProperty("spring.config.name", "products-server");

		SpringApplication.run(ProductsServer.class, args);
	}
}
