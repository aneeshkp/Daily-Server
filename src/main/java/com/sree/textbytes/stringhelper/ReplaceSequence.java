package com.sree.textbytes.stringhelper;

/**
 * Created by IntelliJ IDEA.
 * @User        : Sreejith.S
 *
 */


import java.util.ArrayList;
import java.util.List;

/**
 * Wraps the usage of making multiple string replacements in an ordered sequence.
 * For Example... instead of doing this over and over:</p>
 * <blockquote>
 * <pre>
 *     String text = "   Some example text     ";
 *     text = text.{@link String#replaceAll(String, String) replaceAll}("e", "E");
 *     text = text.{@link String#replaceAll(String, String) replaceAll}(" ", "_");
 *     text = text.{@link String#replaceAll(String, String) replaceAll}("^\\s+$", "");
 *   </pre>
 * </blockquote>
 * You can use a <code>ReplaceSequence</code> like this:</p>
 * <blockquote>
 * <pre>
 *     static final betterReplacements = ReplaceSequence.{@link #create(String, String) create}("e", "E").{@link #append(String, String) append}(" ", "_").{@link #append(String) append}("^\\s+$");
 *
 *     void fixMyString(String text) {
 *       return betterReplacements.{@link #replaceAll(String) replaceAll}(text);
 *     }
 *   </pre>
 * </blockquote>
 *
 * Internally, an ordered list of {@link java.util.regex.Matcher}s and its associated replacement is built as the {@link #append} method is called.<br/>
 * Each matcher is {@link java.util.regex.Matcher#reset(CharSequence) reset} with the input specified in the {@link #replaceAll(String)} method.</p>
 * Use of this class can improve performance if the sequence of replacements is intended to be used repeatedly throughout the life of an application.<br/>
 * This is due to the fact that each {@link java.util.regex.Pattern} is only compiled once and each {@link java.util.regex.Matcher} is only generated once.
 */
public class ReplaceSequence {
    /**
     * Creates a new <code>ReplaceSequence</code> with the first pattern to be replaced with an empty <code>String</code>
     *
     * @param firstPattern The regex {@link java.util.regex.Pattern pattern} string for the first replacement
     * @return a new instance
     */
    public static ReplaceSequence create(String firstPattern) {
        return create(firstPattern, StringUtils.empty);
    }

    /**
     * Creates a new <code>ReplaceSequence</code> with the first pattern to be replaced with the specified <code>replaceWith</code> parameter.
     *
     * @param firstPattern The regex {@link java.util.regex.Pattern pattern} {@link String} for the first replacement
     * @param replaceWith  The {@link String} to replace matches of the specified pattern
     * @return a new instance
     */
    public static ReplaceSequence create(String firstPattern, String replaceWith) {
        ReplaceSequence result = new ReplaceSequence(StringReplacement.compile(firstPattern, replaceWith));
        return result;
    }

    /**
     * Appends a new pattern to this instance in a builder pattern
     *
     * @param pattern The regex {@link java.util.regex.Pattern pattern} {@link String} for this replacement
     * @return this instance of itself for use in a builder pattern
     */
    public ReplaceSequence append(String pattern) {
        return append(pattern, StringUtils.empty);
    }

    /**
     * Appends a new pattern to this instance in a builder pattern
     *
     * @param pattern     The regex {@link java.util.regex.Pattern pattern} {@link String} for this replacement
     * @param replaceWith The {@link String} to replace matches of the specified pattern
     * @return this instance of itself for use in a builder pattern
     */
    public ReplaceSequence append(String pattern, String replaceWith) {
        replacements.add(StringReplacement.compile(pattern, replaceWith));
        return this;
    }

    /**
     * Applies each of the replacements specified via the initial {@link #create(String)} and/or any additional via {@link #append(String)}
     *
     * @param input the {@link String} to apply all of the replacements to
     * @return the resulting {@link String} after all replacements have been applied
     */
    public String replaceAll(String input) {
        if (StringUtils.isNullOrEmpty(input)) return StringUtils.empty;
        for (StringReplacement rp : replacements) {
            input = rp.replaceAll(input);
        }
        return input;
    }

    private List<StringReplacement> replacements = new ArrayList<StringReplacement>();

    private ReplaceSequence(StringReplacement pair) {
        replacements.add(pair);
    }

}

