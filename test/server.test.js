const { register } = require('./auth'); // Import the function to be tested

describe('User Registration', () => {
    it('should register a new user', async () => {
        // Mock request and response objects
        const req = { body: { username: 'testuser', email: 'test@example.com', password: 'password123' } };
        const res = { status: jest.fn(), json: jest.fn() };

        // Call the register function with mocked request and response
        await register(req, res);

        // Verify that the response status is 201 and the appropriate message is sent
        expect(res.status).toHaveBeenCalledWith(201);
        expect(res.json).toHaveBeenCalledWith({ message: 'User registered successfully' });
    });

    // Add more test cases for different scenarios
});
