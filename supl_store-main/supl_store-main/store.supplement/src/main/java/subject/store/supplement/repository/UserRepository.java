package subject.store.supplement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import subject.store.supplement.entities.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    List<User> findByUsername(String username);
    List<User> findByRole(String role);

    User findFirstByUsername(String username);
}
