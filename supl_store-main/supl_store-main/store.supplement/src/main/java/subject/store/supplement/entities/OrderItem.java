package subject.store.supplement.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class OrderItem {
    @Id @GeneratedValue
    private Long id;

    private int quantity;
    private double price;

    @ManyToOne
    private Order order;

    @ManyToOne
    private ProductVariant variant;
}
