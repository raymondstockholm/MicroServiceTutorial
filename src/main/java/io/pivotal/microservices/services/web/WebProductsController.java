package io.pivotal.microservices.services.web;

import io.pivotal.microservices.products.Product;

import java.util.List;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Client controller, fetches Product info from the microservice via
 * {@link WebProductsService}.
 * 
 * @author Raymond Stockholm (based on Paul Chapman)
 */
@Controller
public class WebProductsController {

	@Autowired
	protected WebProductsService productsService;

	protected Logger logger = Logger.getLogger(WebProductsController.class
			.getName());

	public WebProductsController(WebProductsService productsService) {
		this.productsService = productsService;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setAllowedFields("accountNumber", "searchText");
	}

	@RequestMapping("/products")
	public String goHome() {
		return "index";
	}

	@RequestMapping("/products/{name}")
	public String byName(Model model,
			@PathVariable("name") String name) {

		logger.info("web-service byName() invoked: " + name);

		Product product = productsService.findByName(name);
		logger.info("web-service byName() found: " + product);
		model.addAttribute("product", product);
		return "product";
	}

	@RequestMapping("/products/name/{text}")
	public String nameSearch(Model model, @PathVariable("text") String name) {
		logger.info("web-service byOwner() invoked: " + name);

		List<Product> products = productsService.byNameContains(name);
		logger.info("web-service byOwner() found: " + products);
		model.addAttribute("search", name);
		if (products != null)
			model.addAttribute("products", products);
		return "products";
	}


}
