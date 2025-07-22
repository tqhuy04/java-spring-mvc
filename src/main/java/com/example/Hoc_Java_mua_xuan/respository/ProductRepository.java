package com.example.Hoc_Java_mua_xuan.respository;

import com.example.Hoc_Java_mua_xuan.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

Page<Product> findByNameContainingIgnoreCase(String keyword, Pageable pageable);

Page<Product> findByNameContainingIgnoreCaseAndActiveTrue(String keyword, Pageable pageable);

Page<Product> findByNameContainingIgnoreCaseAndBrand(String keyword, String brand, Pageable pageable);

Page<Product> findByNameContainingIgnoreCaseAndBrandAndActiveTrue(String keyword, String brand, Pageable pageable);


@Query("""
    SELECT p FROM Product p
    WHERE p.active = true
      AND (:keyword IS NULL OR LOWER(p.name) LIKE LOWER(CONCAT('%', :keyword, '%')))
      AND (:brand IS NULL OR :brand = '' OR p.brand = :brand)
""")
Page<Product> searchAdvanced(
        @Param("keyword") String keyword,
        @Param("brand") String brand,
        @Param("minPrice") Double minPrice,
        @Param("maxPrice") Double maxPrice,
        Pageable pageable
);


}
