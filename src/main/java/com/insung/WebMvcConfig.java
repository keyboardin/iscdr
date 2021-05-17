package com.insung;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.BeanNameViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
 
	@Bean
	public MappingJackson2JsonView jsonView() {
		MappingJackson2JsonView mappingJackson2JsonView = new MappingJackson2JsonView();
		mappingJackson2JsonView.setContentType("application/json;charset=UTF-8");
		return mappingJackson2JsonView;
	} 

	@Bean
	public BeanNameViewResolver viewResolver() {
		BeanNameViewResolver beanNameViewResolver = new BeanNameViewResolver();
		beanNameViewResolver.setOrder(1);
		return beanNameViewResolver;
	}
	
//	@Bean
//	public CommonsMultipartResolver multipartResolver() {
//		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
//		return commonsMultipartResolver;
//	}
	
	@Autowired
	@Qualifier(value="loginCheckInterceptor")
	private HandlerInterceptor interceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
				.addPathPatterns("/*.do")
				.addPathPatterns("/*/**.do")
				.addPathPatterns("/*/*/**.do");	
				//.excludePathPatterns("/user/**");
	}
 
	
	@Bean
	public SessionLocaleResolver localeResolver() {
		return new SessionLocaleResolver();
	}
	
	@Bean
	public ReloadableResourceBundleMessageSource messageSource() {
		ReloadableResourceBundleMessageSource reloadableResourceBundleMessageSource = new ReloadableResourceBundleMessageSource();
		reloadableResourceBundleMessageSource.setBasename("classpath:properties/messages/Messages");
		reloadableResourceBundleMessageSource.setDefaultEncoding("UTF-8");
		reloadableResourceBundleMessageSource.setCacheSeconds(180);
		
		return reloadableResourceBundleMessageSource;
	}
	
//	@Bean
//	public static PropertyPlaceholderConfigurer propertyPlaceholderConfigurer() {
//		return new PropertyPlaceholderConfigurer();
//	}
	 
}
