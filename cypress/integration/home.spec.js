describe("Testing Home Page", () => {
  before(() => {
    cy.visit("0.0.0.0:3000"); // Visit Home Page
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});