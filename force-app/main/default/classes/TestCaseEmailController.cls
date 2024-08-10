@isTest
public class TestCaseEmailController{
    @isTest
    static void testCaseEmailController() {
        // Create test data
        Contact testContact = new Contact(FirstName = 'Test', LastName = 'User', Email = 'testuser@example.com');
        insert testContact;
        
        Case testCase1 = new Case(ContactId = testContact.Id, Subject = 'Test Case 1', Status = 'New');
        Case testCase2 = new Case(ContactId = testContact.Id, Subject = 'Test Case 2', Status = 'New');
        insert testCase1;
        insert testCase2;
        
        Test.startTest();
        
        // Simulate setting parameters
        PageReference pageRef = Page.dummyPage; // Use any dummy Visualforce page reference
        Test.setCurrentPage(pageRef);
        ApexPages.currentPage().getParameters().put('recipientId', testContact.Id);
        ApexPages.currentPage().getParameters().put('relatedToId', testCase1.Id);
        
        // Initialize controller
        CaseEmailController controller = new CaseEmailController();
        
        Test.stopTest();
        
        // Verify results
        System.assertEquals(2, controller.cases.size(), 'Number of cases should be 2');
        System.assertEquals('Test Case 1', controller.cases[0].Subject, 'First case subject should be "Test Case 1"');
        System.assertEquals('Test Case 2', controller.cases[1].Subject, 'Second case subject should be "Test Case 2"');
    }
}