package com.college.util;

import java.sql.Connection;

public class TestDB {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("Connection Test PASSED!");
        } else {
            System.out.println("Connection Test FAILED!");
        }
    }
}