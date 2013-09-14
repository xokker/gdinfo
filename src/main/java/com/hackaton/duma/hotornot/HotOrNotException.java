package com.hackaton.duma.hotornot;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/14/13
 * Time: 7:37 PM
 */
public class HotOrNotException extends Exception {
    public HotOrNotException() {
    }

    public HotOrNotException(String message) {
        super(message);
    }

    public HotOrNotException(String message, Throwable cause) {
        super(message, cause);
    }

    public HotOrNotException(Throwable cause) {
        super(cause);
    }

    public HotOrNotException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
