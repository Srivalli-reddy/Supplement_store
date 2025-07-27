package subject.store.supplement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import subject.store.supplement.entities.User;
import subject.store.supplement.repository.UserRepository;

@Service
public class RegisterService {

    @Autowired
    private UserRepository userRepository;

    public boolean registerNewUser(String username, String password, String role) {

        // Check if username already exists
        if (userRepository.findByRole(username) != null) {
            return false; // Username taken
        }

        // Create and save new user
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role.toUpperCase()); // Save role as uppercase (ADMIN or CUSTOMER)

        userRepository.save(user);
        return true;
    }
}
