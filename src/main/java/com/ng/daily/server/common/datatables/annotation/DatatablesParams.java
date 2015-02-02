package com.ng.daily.server.common.datatables.annotation;

import java.lang.annotation.*;

/**
 * DataTables 参数注解
 */
@Documented
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
public @interface DatatablesParams {
}
