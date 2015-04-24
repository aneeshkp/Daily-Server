package com.sree.textbytes.readability;

import com.sree.textbytes.stringhelper.StringUtils;
import org.jsoup.nodes.Element;

/**
 * Methods to update,get and set content scores to {@link org.jsoup.nodes.Element} as attributes
 */

public class ScoreInfo {

    /**
     * Increment the content score of an {@link org.jsoup.nodes.Element}
     *
     * @param node
     * @param addToScore
     */

    public static void updateContentScore(Element node, double addToScore) {
        double currentScore;
        try {
            currentScore = getContentScore(node);

        } catch (NumberFormatException e) {
            currentScore = 0;
        }
        double newScore = currentScore + addToScore;
        setContentScore(node, newScore);
    }

    /**
     * Set content score as {@link org.jsoup.nodes.Element} attribute
     *
     * @param el
     * @param score
     */
    public static void setContentScore(Element el, double score) {
        el.attr("algoScore", Double.toString(score));

    }

    /**
     * Get content score of an {@link org.jsoup.nodes.Element}
     *
     * @param node
     * @return
     */
    public static double getContentScore(Element node) {
        if (node == null)
            return 0;
        try {
            String grvScoreString = node.attr("algoScore");
            if (StringUtils.isNullOrEmpty(grvScoreString))
                return 0;
            return Double.parseDouble(grvScoreString);

        } catch (NumberFormatException e) {
            return 0;
        }
    }

    /**
     * Check whether an {@link org.jsoup.nodes.Element} is scored or not
     *
     * @param node
     * @return
     */

    public static boolean isElementScored(Element node) {
        return node.hasAttr("algoScore");
    }

}
