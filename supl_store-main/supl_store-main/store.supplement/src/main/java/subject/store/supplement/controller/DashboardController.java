package subject.store.supplement.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import subject.store.supplement.entities.User;
import subject.store.supplement.repository.UserRepository;
import subject.store.supplement.repository.ProductRepository;

@Controller
public class DashboardController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return "redirect:/login";
        }

        model.addAttribute("products", productRepository.findAll());

        if ("ADMIN".equals(user.getRole())) {
            model.addAttribute("users", userRepository.findAll());
            return "admin_dashboard";
        } else {
            return "cust_dashboard";
        }
    }
}
