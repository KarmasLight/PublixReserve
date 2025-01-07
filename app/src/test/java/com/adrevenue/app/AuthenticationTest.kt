package com.adrevenue.app

import org.junit.Assert.*
import org.junit.Test

class AuthenticationTest {
    @Test
    fun testValidEmailFormat() {
        val validEmails = listOf(
            "user@example.com",
            "john.doe@gmail.com",
            "test123@company.co.uk"
        )
        
        validEmails.forEach { email ->
            assertTrue("Email $email should be valid", isValidEmail(email))
        }
    }

    @Test
    fun testInvalidEmailFormat() {
        val invalidEmails = listOf(
            "invalid-email",
            "user@",
            "@domain.com",
            "user@domain"
        )
        
        invalidEmails.forEach { email ->
            assertFalse("Email $email should be invalid", isValidEmail(email))
        }
    }

    // Email validation helper function
    private fun isValidEmail(email: String): Boolean {
        val emailRegex = Regex("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\$")
        return email.matches(emailRegex)
    }

    // Main method for standalone running
    companion object {
        @JvmStatic
        fun main(args: Array<String>) {
            val test = AuthenticationTest()
            test.testValidEmailFormat()
            test.testInvalidEmailFormat()
            println("All tests completed successfully!")
        }
    }
}
