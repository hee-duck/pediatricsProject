package com.spring.kiddiecare.domain.likeHospital;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface LikeHospitalRepository extends JpaRepository<LikeHospital, Integer> {
    boolean existsByUserNoAndYkiho(int userNo, String ykiho);
    LikeHospital findByUserNoAndYkiho(int userNo, String ykiho);

    LikeHospital findByUserNoAndHospitalNameAndSgguCd(int userNo, String hospitalName, String sgguCd);

    Optional<LikeHospital> findLikeHospitalByUserNoAndYkiho(int userNo, String ykiho);

    Optional<LikeHospital> findLikeHospitalByUserNoAndHospitalNameAndSgguCd(int userNo, String hospitalName, String sgguCd);

    List<LikeHospital> findByUserNo(int userNo);

}
