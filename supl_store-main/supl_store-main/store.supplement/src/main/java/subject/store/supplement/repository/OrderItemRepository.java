package subject.store.supplement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import subject.store.supplement.entities.Order;

import java.util.List;

@Repository
public interface OrderItemRepository extends JpaRepository<Order, Long> {
    // Find all orders placed by a user
    List<Order> findByUserId(Long userId);
}
