package subject.store.supplement.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import subject.store.supplement.entities.Product;
import subject.store.supplement.entities.User;
import subject.store.supplement.repository.ProductRepository;
import subject.store.supplement.repository.UserRepository;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    // Admin dashboard: shows products + users
    @GetMapping("/dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        if (!"ADMIN".equals(session.getAttribute("role"))) return "access-denied";

        List<Product> products = productRepository.findAll();
        List<User> users = userRepository.findAll();

        model.addAttribute("products", products);
        model.addAttribute("users", users);
        return "admin_dashboard";
    }

    // Show add product form
    @GetMapping("/addProduct")
    public String showAddProductForm(HttpSession session) {
        if (!"ADMIN".equals(session.getAttribute("role"))) return "access-denied";
        return "add_product";
    }

    // Handle product addition using direct image URL (no upload)
    @PostMapping("/addProduct")
    public String handleAddProduct(@RequestParam String name,
                                   @RequestParam double price,
                                   @RequestParam String imageUrl,
                                   HttpSession session) {
        if (!"ADMIN".equals(session.getAttribute("role"))) return "access-denied";

        Product product = new Product();
        product.setName(name);
        product.setPrice(price);
        product.setImageUrl(imageUrl); // directly use the URL input

        productRepository.save(product);
        return "redirect:/admin/dashboard";
    }

    // Delete user by ID
    @PostMapping("/deleteUser/{id}")
    public String deleteUser(@PathVariable Long id, HttpSession session) {
        if (!"ADMIN".equals(session.getAttribute("role"))) return "access-denied";

        userRepository.deleteById(id);
        return "redirect:/admin/dashboard";
    }
}
