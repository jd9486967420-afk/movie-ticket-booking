package com.example.theater.util;
import com.fasterxml.jackson.databind.*; import com.fasterxml.jackson.databind.node.*;
public final class Json {
 public static final ObjectMapper M=new ObjectMapper();
 public static ObjectNode ok(String msg){return M.createObjectNode().put("success",true).put("message",msg);}
 public static ObjectNode error(String msg){return M.createObjectNode().put("success",false).put("message",msg);}
}
