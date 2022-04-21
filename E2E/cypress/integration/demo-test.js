/// <reference types="cypress" />

describe('demonstration cypress test with demo razor app', () => {
    it('should link to something', () => {
       cy.visit('/');
       cy.contains('a', 'Home').should('exist');
       cy.contains('a', 'Privacy').click();
       cy.contains('Privacy Policy').should('exist');
    });
});