describe("Product Details", () => {
  before(() => {
    cy.visit("0.0.0.0:3000"); // Visit Home Page
  })

  it("should be able to visit from home page", () => {
    cy.get(".products article")
      .first()
      .click();

      cy.contains(".product-detail", "Add");
  });
});