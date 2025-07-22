package com.example.Hoc_Java_mua_xuan.controller;

import com.example.Hoc_Java_mua_xuan.domain.Product;
import com.example.Hoc_Java_mua_xuan.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    // ==================== CLIENT ====================
    @GetMapping("/product")
    public String listClient(
        @RequestParam(defaultValue = "") String keyword,
        @RequestParam(required = false) String brand,
        @RequestParam(defaultValue = "0") String pageStr,
        Model model
    ) {
        int page = 0;
        try {
            page = Integer.parseInt(pageStr);
        } catch (NumberFormatException e) {
            page = 0; // fallback an toàn
        }

        Page<Product> products = productService.getAllClient(keyword, brand, page, 6);
        model.addAttribute("products", products);
        model.addAttribute("keyword", keyword);
        model.addAttribute("brand", brand);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("baseUrl", "/product");

        return "client/product/list";
    }

    @GetMapping("/product/detail/{id}")
    public String detail(@PathVariable Long id, Model model) {
        Product product = productService.getById(id).orElse(null);
        if (product == null || !product.isActive()) return "redirect:/product";
        model.addAttribute("product", product);
        return "client/product/detail";
    }

    // ==================== ADMIN ====================
    @GetMapping("/admin/product")
    public String listAdmin(
        @RequestParam(defaultValue = "") String keyword,
        @RequestParam(required = false) String brand,
        @RequestParam(defaultValue = "0") String pageStr,
        Model model
    ) {
        int page = 0;
        try {
            page = Integer.parseInt(pageStr);
        } catch (NumberFormatException e) {
            page = 0; // fallback an toàn
        }

        Page<Product> products = productService.getAllAdmin(keyword, brand, page, 5);
        model.addAttribute("products", products);
        model.addAttribute("keyword", keyword);
        model.addAttribute("brand", brand);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        model.addAttribute("baseUrl", "/admin/product");

        return "admin/product/list";
    }

    @GetMapping("/admin/product/create")
    public String createForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String save(@ModelAttribute Product product) {
        productService.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/edit/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Product product = productService.getById(id).orElse(null);
        if (product == null) return "redirect:/admin/product";
        model.addAttribute("product", product);
        return "admin/product/edit";
    }

    @PostMapping("/admin/product/edit/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Product product) {
        product.setId(id);
        productService.save(product);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String delete(@PathVariable Long id) {
        productService.delete(id);
        return "redirect:/admin/product";
    }
}
