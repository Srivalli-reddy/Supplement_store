package subject.store.supplement.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class ProductVariant {
    @Id @GeneratedValue
    private Long id;
    private String size;
    private int stock;

    @ManyToOne
    private Product product;
}
