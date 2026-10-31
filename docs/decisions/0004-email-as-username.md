# 0004: Email address is the Cognito username
Status: accepted
Context: The hackathon pool treated email as an alias, which forced the frontend to generate a random username at sign-up.
Decision: Use username_attributes = [email] so the email is the username.
Consequences: Simpler frontend sign-up, sign-in and password reset. Default Cognito email has a daily sending limit, which is fine for a demo.
