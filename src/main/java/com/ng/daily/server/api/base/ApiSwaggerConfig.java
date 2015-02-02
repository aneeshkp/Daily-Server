package com.ng.daily.server.api.base;

import com.mangofactory.swagger.configuration.SpringSwaggerConfig;
import com.mangofactory.swagger.models.dto.ApiInfo;
import com.mangofactory.swagger.plugin.EnableSwagger;
import com.mangofactory.swagger.plugin.SwaggerSpringMvcPlugin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
* Swagger 生成API文档配置
*/
@Configuration
@EnableSwagger //Loads the spring beans required by the framework
public class ApiSwaggerConfig {

    private SpringSwaggerConfig springSwaggerConfig;

    /**
     * Required to autowire SpringSwaggerConfig
     */
    @Autowired
    public void setSpringSwaggerConfig(SpringSwaggerConfig springSwaggerConfig) {
        this.springSwaggerConfig = springSwaggerConfig;
    }

    /**
     * Every SwaggerSpringMvcPlugin bean is picked up by the swagger-mvc framework - allowing for multiple
     * swagger groups i.e. same code base multiple swagger resource listings.
     */
    @Bean
    public SwaggerSpringMvcPlugin customImplementation() {
        return new SwaggerSpringMvcPlugin(this.springSwaggerConfig)
                .includePatterns(".api.*")
                .apiInfo(apiInfo());
    }


    private ApiInfo apiInfo() {
        ApiInfo apiInfo = new ApiInfo(
                "服务端接口文档",
                "Description",
                "term of service",
                "Contact Email",
                "Licence Type",
                "License URL"
        );
        return apiInfo;
    }

}