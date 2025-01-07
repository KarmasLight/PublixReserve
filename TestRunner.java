import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
import org.junit.Test;

public class TestRunner {
    public static class AuthenticationTest {
        @Test
        public void testValidEmailFormat() {
            String[] validEmails = {
                "user@example.com",
                "john.doe@gmail.com",
                "test123@company.co.uk"
            };
            
            for (String email : validEmails) {
                assert isValidEmail(email) : "Email " + email + " should be valid";
            }
        }

        @Test
        public void testInvalidEmailFormat() {
            String[] invalidEmails = {
                "invalid-email",
                "user@",
                "@domain.com",
                "user@domain"
            };
            
            for (String email : invalidEmails) {
                assert !isValidEmail(email) : "Email " + email + " should be invalid";
            }
        }

        private boolean isValidEmail(String email) {
            return email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$");
        }
    }

    public static void main(String[] args) {
        Result result = JUnitCore.runClasses(AuthenticationTest.class);
        
        System.out.println("Test Results:");
        System.out.println("Total tests: " + result.getRunCount());
        System.out.println("Failed tests: " + result.getFailureCount());
        
        for (Failure failure : result.getFailures()) {
            System.out.println(failure.toString());
        }
        
        if (result.wasSuccessful()) {
            System.out.println("All tests passed successfully!");
            System.exit(0);
        } else {
            System.out.println("Some tests failed.");
            System.exit(1);
        }
    }
}
