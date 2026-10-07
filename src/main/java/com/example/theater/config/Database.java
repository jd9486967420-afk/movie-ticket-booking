package com.example.theater.config;
import java.sql.*;
public final class Database {
 private Database(){}
 public static Connection getConnection() throws SQLException {
  String host=env("DB_HOST","localhost"), port=env("DB_PORT","3306"), db=env("DB_NAME","theater_booking");
  String user=env("DB_USER","root"), pass=env("DB_PASSWORD","");
  String url="jdbc:mysql://"+host+":"+port+"/"+db+"?useSSL=false&serverTimezone=Asia/Kolkata&allowPublicKeyRetrieval=true";
  return DriverManager.getConnection(url,user,pass);
 }
 private static String env(String k,String d){String v=System.getenv(k); return v==null||v.isBlank()?d:v;}
}
