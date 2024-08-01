package com.pupz.pupz.database.dao;

import com.pupz.pupz.database.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostDAO  extends JpaRepository<Post, Long> {

}
