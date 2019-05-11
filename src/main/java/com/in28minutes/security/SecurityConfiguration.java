package com.in28minutes.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.in28minutes.config.ConfigUtilService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

	@Autowired
	ConfigUtilService configUtilService;

	@Autowired
	public void configureGlobalSecurity(AuthenticationManagerBuilder auth) throws Exception {
		auth.inMemoryAuthentication().withUser("tom").password("abcd").roles("USER", "ADMIN");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		String springDispatcherURLPattern = configUtilService.getSpringDispatcherURLPattern();

		http.authorizeRequests().antMatchers("/login").permitAll()
				.antMatchers(springDispatcherURLPattern + "/", springDispatcherURLPattern + "/*todo*/**")
				.access("hasRole('USER')").and().formLogin();
	}

}
