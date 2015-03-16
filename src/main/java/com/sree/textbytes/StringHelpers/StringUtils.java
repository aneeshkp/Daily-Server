package com.sree.textbytes.stringhelpers;

/**
 * Created by IntelliJ IDEA.
 * 
 * @User  		: Sreejith.S
 * 
 */
public class StringUtils
{
	private StringUtils(){}
	public static final String empty = "";
	public static final String[] emptyArray = new String[] {empty};
	public static boolean isNullOrEmpty(String input) {
		if (input == null) return true;
		if (input.length() == 0) return true;
		return false;
	}
	public static StringSplitter SPACE_SPLITTER = new StringSplitter(" ");
}

