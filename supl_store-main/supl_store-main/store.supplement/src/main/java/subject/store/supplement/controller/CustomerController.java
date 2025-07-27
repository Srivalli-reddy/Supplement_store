
package subject.store.supplement.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import subject.store.supplement.entities.CartItem;
import subject.store.supplement.entities.Product;
import subject.store.supplement.entities.User;
import subject.store.supplement.repository.CartItemRepository;
import subject.store.supplement.repository.ProductRepository;
import subject.store.supplement.repository.UserRepository;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CartItemRepository cartItemRepository;

    // Show customer dashboard with product list
    @GetMapping("/dashboard")
    public String customerDashboard(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<Product> products = productRepository.findAll();
        model.addAttribute("products", products);
        model.addAttribute("username", username);

        return "cust_dashboard"; // JSP page: cust_dashboard.jsp
    }

    // Add a product to the cart
    @PostMapping("/cart/add/{productId}")
    public String addToCart(@PathVariable Long productId, HttpSession session) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<User> users = userRepository.findByUsername(username);
        if (users.isEmpty()) return "redirect:/login";

        User user = users.get(0);
        Product product = productRepository.findById(productId).orElse(null);

        if (product != null) {
            CartItem cartItem = new CartItem(user, product, 1); // default quantity = 1
            cartItemRepository.save(cartItem);
        }

        return "redirect:/customer/dashboard";
    }

    // View cart items
    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        String username = (String) session.getAttribute("username");
        if (username == null) return "redirect:/login";

        List<User> users = userRepository.findByUsername(username);
        if (users.isEmpty()) return "redirect:/login";

        User user = users.get(0);
        List<CartItem> cartItems = cartItemRepository.findByUser(user);

        double total = cartItems.stream()
                .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                .sum();

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", total);
        return "cart"; // JSP page: cart.jsp
    }

    // Delete cart item
    @GetMapping("/cart/delete/{cartItemId}")
    public String deleteCartItem(@PathVariable Long cartItemId) {
        cartItemRepository.deleteById(cartItemId);
        return "redirect:/customer/cart";
    }
}
