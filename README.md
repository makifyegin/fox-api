# Fox

A booking system API for [Servas International](https://servas.org), enabling new applicants to schedule interviews with regional interviewers.

## Why this project?

While building a booking system for Servas International, I tried several open source scheduling tools. Every time, I hit the same wall — the features I needed were locked behind enterprise or paid editions. Open source shouldn't mean "free demo."

So I decided to build it myself, truly open source, with no paid tiers or locked features. If you need a simple, honest booking system — use it, fork it, make it yours.

## What it does

Servas operates globally with interviewers organised by country and region. When a new applicant joins, they need to book an interview with an available interviewer in their area. This API powers that booking flow:

- Applicants visit a public page, see available slots in their region, and book an interview
- Interviewers set their own availability and manage bookings
- Admins manage countries, regions, and interviewer teams
- Supports 15 or 30 minute interviews (video via Jitsi or in-person)
- Email verification for applicants (no account required)
- Waitlist when no slots are available

## Tech stack

- **Ruby** 3.4.5
- **Rails** 8.1.3 (API-only mode)
- **PostgreSQL** 17 (via Docker)
- **RSpec** for testing
- **JWT** for authentication
- **bcrypt** for password encryption

## Getting started

### Prerequisites

- Ruby 3.4.5
- Bundler
- Docker

### Setup

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/fox-api.git
cd fox-api

# Install dependencies
bundle install

# Start PostgreSQL in Docker
docker run --name fox-db \
  -e POSTGRES_USER=your_username \
  -e POSTGRES_PASSWORD=your_password \
  -e POSTGRES_DB=fox_api_development \
  -p 5432:5432 -d postgres:17

# Create your environment file
cp .env.example .env
# Edit .env with your database credentials

# Create and seed the database
rails db:create
rails db:migrate
rails db:seed

# Start the server
rails server
```

### Environment variables

Create a `.env` file in the project root (see `.env.example`):

```
DATABASE_USERNAME=your_username
DATABASE_PASSWORD=your_password
DATABASE_HOST=localhost
DATABASE_PORT=5432
```

## Running tests

```bash
# Run all tests
rspec

# Run a specific test file
rspec spec/models/user_spec.rb

# Run request specs only
rspec spec/requests
```

## API endpoints

### Public endpoints

| Method | URL | Description |
|--------|-----|-------------|
| GET | `/api/v1/countries` | List all countries |
| GET | `/api/v1/countries/:country_code/regions` | List regions for a country |
| POST | `/api/v1/login` | Login and receive JWT token |

### Protected endpoints (require JWT token)

| Method | URL | Description |
|--------|-----|-------------|
| GET | `/api/v1/profile` | Get current user info |

### Authentication

To access protected endpoints, include the JWT token in the Authorization header:

```bash
# Login to get a token
curl -X POST http://localhost:3000/api/v1/login \
  -H "Content-Type: application/json" \
  -d '{"email": "user@example.com", "password": "your_password"}'

# Use the token for protected endpoints
curl http://localhost:3000/api/v1/profile \
  -H "Authorization: Bearer YOUR_TOKEN_HERE"
```

## Data model

```
Country (249 ISO 3166 countries)
  └── Region (e.g. London, Scotland)
       └── User (interviewer or admin)
            └── Availability (free time slots)
                 └── Booking (applicant picks a slot)
```

## Project status

🚧 Under active development

- [x] Country model with ISO 3166 codes
- [x] Region model with country association
- [x] User model with roles (admin/interviewer)
- [x] JWT authentication (login, protected endpoints)
- [x] Profile endpoint
- [x] Countries API endpoint
- [x] Regions API endpoint
- [ ] Interviewer availability
- [ ] Booking system
- [ ] Email verification for applicants
- [ ] Waitlist
- [ ] Rescheduling/cancellation
- [ ] Jitsi video call integration

## Contributing

This is an open source project. Contributions are welcome! Please open an issue or submit a pull request.

## Licence

[MIT](LICENSE)