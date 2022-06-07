describe("User Login", () => {
  before(() => {
    cy.visit("0.0.0.0:3000"); // Visit Home Page
  })

  it("should be able to login with existing user", () => {   
    cy.contains(".nav-link", "Login")
      .click();

    cy.get("#email")
      .type("test@test.com");
    
    cy.get("#password")
      .type("password");

    cy.contains("input", "Login")
      .click();

    cy.contains(".nav-link", "Logout")
      .click();
  });

  it("should be able to register and login with new user", () => {   
    cy.contains(".nav-link", "Register")
      .click();

    // Registration
    cy.get("#user_first_name")
      .type("Tarzan");

    cy.get("#user_last_name")
      .type("Jane");

    cy.get("#user_email")
      .type("email@email.com");
    
    cy.get("#user_password")
      .type("password");

    cy.get("#user_password_confirmation")
      .type("password");

    cy.contains("input", "Register")
      .click();

    // Confirmation
    cy.contains(".nav-link", "Logout");
    cy.contains(".nav-link", "Signed in as Tarzan");
  });
});