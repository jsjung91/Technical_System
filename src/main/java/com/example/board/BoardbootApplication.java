package com.example.board;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
@MapperScan(value= {"com.example.board.mapper"}) // Mapper Interface를 인식할 수 있도록 설정
public class BoardbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(BoardbootApplication.class, args);
	}
	
	/*
	 * SqlSessionFactory 설정
	 */
	@Bean //Spring에 필요한 객체를 생성
	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
		
		sessionFactory.setDataSource(dataSource);
		
		return sessionFactory.getObject();
	}
	
}
