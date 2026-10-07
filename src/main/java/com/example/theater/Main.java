package com.example.theater;
import com.example.theater.controller.ApiServer;
public class Main { public static void main(String[] args) throws Exception { new ApiServer(8080).start(); } }
