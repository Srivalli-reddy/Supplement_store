package subject.store.supplement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import subject.store.supplement.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    // Example: Find all products by category
    List<Product> findByCategory(String category);
}
