package com.ng.daily.server.common.util;

import org.imgscalr.Scalr;

import java.awt.image.BufferedImage;

/**
 * Created by fangs on 15/2/10.
 */
public class ImageUtil {


    public static BufferedImage createThumbnail(BufferedImage image, int targetSize) {
        BufferedImage thumbnail = Scalr.resize(image, targetSize);
        return thumbnail;
    }


}
