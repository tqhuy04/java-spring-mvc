package com.example.Hoc_Java_mua_xuan.service;

import com.example.Hoc_Java_mua_xuan.domain.Product;
import com.example.Hoc_Java_mua_xuan.respository.ProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ProductService {

    private final ProductRepository productRepo;

    public ProductService(ProductRepository productRepo) {
        this.productRepo = productRepo;
    }

    // Cho ADMIN: lấy tất cả sản phẩm (true và false)
    public Page<Product> getAllAdmin(String keyword, String brand, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        if (brand != null && !brand.isEmpty()) {
            return productRepo.findByNameContainingIgnoreCaseAndBrand(keyword, brand, pageable);
        } else {
            return productRepo.findByNameContainingIgnoreCase(keyword, pageable);
        }
    }

    // Cho CLIENT: chỉ lấy sản phẩm active = true
    public Page<Product> getAllClient(String keyword, String brand, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        if (brand != null && !brand.isEmpty()) {
            return productRepo.findByNameContainingIgnoreCaseAndBrandAndActiveTrue(keyword, brand, pageable);
        } else {
            return productRepo.findByNameContainingIgnoreCaseAndActiveTrue(keyword, pageable);
        }
    }

    public Optional<Product> getById(Long id) {
        return productRepo.findById(id);
    }

    public void save(Product product) {
        productRepo.save(product);
    }

    public void delete(Long id) {
        productRepo.deleteById(id);
    }
}

