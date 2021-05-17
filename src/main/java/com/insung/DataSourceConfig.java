package com.insung;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
//@PropertySource("classpath:/application.properties")
public class DataSourceConfig {
 
	@Autowired
	private ApplicationContext applicationContext;
	
	
	//##### PostgreSQL ######
	@Bean(name="dataSource")
    @ConfigurationProperties(prefix="spring.datasource.hikari.postgresql")
    //@ConfigurationProperties("spring.datasource.hikari.postgresql")
    public DataSource dataSource() {
    	return DataSourceBuilder.create()
    			.type(HikariDataSource.class)
    			.build(); 
    }
    
    @Bean(name="sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactoryBean(@Autowired @Qualifier("dataSource") DataSource dataSource)
            throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
        sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/postgresql/*.xml")); 
        //System.out.println(">>>>> "+applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
        //System.out.println(">>>>> "+applicationContext.getResources("classpath:mybatis/mapper/postgresql/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }
 
    @Bean(name="sqlSession")
    public SqlSessionTemplate sqlSession(@Autowired @Qualifier("sqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
 
    @Bean(name="transactionManager")
    public DataSourceTransactionManager transactionManager(@Autowired @Qualifier("dataSource") DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }
    
    
    


    //##### MSSQL #####
    @Bean(name="dataSourceMs")
    @ConfigurationProperties(prefix="spring.datasource.hikari.mssql")
    //@ConfigurationProperties("spring.datasource.hikari.postgresql")
    public DataSource dataSourceMs() {
    	return DataSourceBuilder.create()
    			.type(HikariDataSource.class)
    			.build(); 
    }
    
    @Bean(name="sqlSessionFactoryMs")
    public SqlSessionFactory sqlSessionFactoryBeanMs(@Autowired @Qualifier("dataSourceMs") DataSource dataSource)
    		throws Exception {
    	SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
    	sqlSessionFactoryBean.setDataSource(dataSource);
    	sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
    	sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/mssql/*.xml")); 
    	//System.out.println(">>>>> "+applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
    	//System.out.println(">>>>> "+applicationContext.getResources("classpath:mybatis/mapper/postgresql/*.xml"));
    	return sqlSessionFactoryBean.getObject();
    }
    
    @Bean(name="sqlSessionMs")
    public SqlSessionTemplate sqlSessionMs(@Autowired @Qualifier("sqlSessionFactoryMs") SqlSessionFactory sqlSessionFactory) {
    	return new SqlSessionTemplate(sqlSessionFactory);
    }
    
    @Bean(name="transactionManagerMs")
    public DataSourceTransactionManager transactionManagerMs(@Autowired @Qualifier("dataSourceMs") DataSource dataSource) {
    	return new DataSourceTransactionManager(dataSource);
    }
    
    
    
//    @Bean(name="dataSource")
//    @ConfigurationProperties(prefix="spring.datasource.hikari.postgresql")
//    //@ConfigurationProperties("spring.datasource.hikari.postgresql")
//    public DataSource dataSource() {
//    	return DataSourceBuilder.create()
//    			.type(HikariDataSource.class)
//    			.build(); 
//    }
//    
//    @Bean(name="sqlSessionFactory")
//    public SqlSessionFactory sqlSessionFactoryBean(@Autowired @Qualifier("dataSource") DataSource dataSource)
//    		throws Exception {
//    	SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
//    	sqlSessionFactoryBean.setDataSource(dataSource);
//    	sqlSessionFactoryBean.setConfigLocation(applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
//    	sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:mybatis/mapper/postgresql/*.xml")); 
//    	//System.out.println(">>>>> "+applicationContext.getResource("classpath:mybatis/config/mybatis-config.xml"));
//    	//System.out.println(">>>>> "+applicationContext.getResources("classpath:mybatis/mapper/postgresql/*.xml"));
//    	return sqlSessionFactoryBean.getObject();
//    }
//    
//    @Bean(name="sqlSession")
//    public SqlSessionTemplate sqlSession(@Autowired @Qualifier("sqlSessionFactory") SqlSessionFactory sqlSessionFactory) {
//    	return new SqlSessionTemplate(sqlSessionFactory);
//    }
//    
//    @Bean(name="transactionManager")
//    public DataSourceTransactionManager transactionManager(@Autowired @Qualifier("dataSource") DataSource dataSource) {
//    	return new DataSourceTransactionManager(dataSource);
//    }
   
 
}
