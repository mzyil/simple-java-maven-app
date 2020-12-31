package com.mycompany.app;

/**
 * Hello world!
 */
public class App
{

    private final String message = "We work in the darkness to serve the light";

    public App() {}

    public static void main(String[] args) {
        System.out.println(new App().getMessage());
    }

    private final String getMessage() {
        return message;
    }

}
