package ru.javarush.repository.custom;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.javarush.model.User;

import java.util.List;

/**
 * Created by Тимур on 21.02.2017.
 */
public interface UserRepositoryCustom {

    Page<User> findByNameContaining(@Param("name")String name,Pageable pageable);

}
