package com.example.Hoc_Java_mua_xuan.respository;

import com.example.Hoc_Java_mua_xuan.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    // Tìm kiếm theo tên gần đúng (LIKE %keyword%)
    List<User> findByFullNameContaining(String keyword);

    // Kiểm tra email đã tồn tại chưa
    boolean existsByEmail(String email);
}
