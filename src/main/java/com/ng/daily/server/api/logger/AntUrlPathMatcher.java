package com.ng.daily.server.api.logger;

import org.springframework.util.AntPathMatcher;
import org.springframework.util.PathMatcher;

/**
 * 字符类型URL匹配
 * @author dengq
 */
public class AntUrlPathMatcher {
	private boolean requiresLowerCaseUrl = true;
	private PathMatcher pathMatcher = new AntPathMatcher();

	public AntUrlPathMatcher() {
		this(true);
	}

	public AntUrlPathMatcher(boolean requiresLowerCaseUrl) {
		this.requiresLowerCaseUrl = requiresLowerCaseUrl;
	}

	public Object compile(String path) {
		if (this.requiresLowerCaseUrl) {
			return path.toLowerCase();
		}

		return path;
	}

	public void setRequiresLowerCaseUrl(boolean requiresLowerCaseUrl) {
		this.requiresLowerCaseUrl = requiresLowerCaseUrl;
	}

	public boolean pathMatchesUrl(Object path, String url) {
		return this.pathMatcher.match((String) path, url);
	}

	public String getUniversalMatchPattern() {
		return "/**";
	}

	public boolean requiresLowerCaseUrl() {
		return this.requiresLowerCaseUrl;
	}

	public String toString() {
		return getClass().getName() + "[requiresLowerCase='"
				+ this.requiresLowerCaseUrl + "']";
	}
}
