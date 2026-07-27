# Script to create 30 structured git commits and push to GitHub

$remoteUrl = "https://github.com/ManuelCarrasco28/Sistema_Web_ElCumbe.git"

# 1. Config
git add package.json package-lock.json tsconfig.json next.config.ts postcss.config.mjs eslint.config.mjs .gitignore next-env.d.ts tsconfig.tsbuildinfo
git commit -m "chore: initialize project configuration and dependencies"

# 2. Docker
git add Dockerfile docker-compose.yml
git commit -m "ci: add Docker containerization setup"

# 3. Env
git add .env.example .env
git commit -m "docs: add environment variables example configuration"

# 4. Prisma schema
git add prisma/schema.prisma prisma.config.ts
git commit -m "db: configure Prisma schema and database models"

# 5. Seeds & initial data
git add scripts/seed-initial.ts init_data.json
git commit -m "db: add initial seed scripts and default data JSON"

# 6. Database utilities
git add lib/prisma.ts lib/utils.ts lib/dates.ts lib/rate-limit.ts
git commit -m "lib: implement database client and core utility functions"

# 7. NextAuth & Auth helpers
git add lib/auth.ts lib/customer-profile.ts
git commit -m "lib: implement NextAuth configuration and RBAC helpers"

# 8. Proxy RBAC middleware
git add proxy.ts
git commit -m "security: implement middleware proxy for RBAC route protection"

# 9. Culqi payment gateway
git add lib/culqi.ts
git commit -m "lib: add Culqi payment gateway integration"

# 10. PDF boleto generator
git add lib/pdfUtils.ts
git commit -m "lib: implement PDF boleto generator and QR code utilities"

# 11. Complaints & bus helpers
git add lib/complaints.ts lib/bus-images.ts
git commit -m "lib: add complaints and bus image helpers"

# 12. Static assets & images
git add public/
git commit -m "assets: add public static assets, logos, and bus images"

# 13. UI Providers & Root layout
git add components/ThemeProvider.tsx components/ThemeToggle.tsx components/WindowsNotificationTrap.tsx app/globals.css app/layout.tsx
git commit -m "ui: add theme provider and global layout setup"

# 14. UI Modals & components
git add components/
git commit -m "ui: add reusable UI components, seat selectors, and modales"

# 15. API Auth endpoints
git add app/api/auth/
git commit -m "api: implement NextAuth authentication API endpoints"

# 16. API viajes endpoints
if (Test-Path "app/api/viajes") { git add app/api/viajes/ }
if (Test-Path "app/api/asientos") { git add app/api/asientos/ }
git commit -m "api: implement REST API endpoints for trips and seat locking"

# 17. API pasajes & Culqi endpoints
if (Test-Path "app/api/pasajes") { git add app/api/pasajes/ }
if (Test-Path "app/api/culqi") { git add app/api/culqi/ }
git commit -m "api: implement pasajes and payment processing endpoints"

# 18. API remaining endpoints
git add app/api/
git commit -m "api: add remaining REST endpoints and complaints services"

# 19. Public root page & layouts
git add app/page.tsx app/\(public\)/layout.tsx
git commit -m "feat: implement public landing page and main navigation layout"

# 20. Auth pages (login, recuperar-password, registro)
if (Test-Path "app/login") { git add app/login/ }
if (Test-Path "app/recuperar-password") { git add app/recuperar-password/ }
if (Test-Path "app/registro") { git add app/registro/ }
git commit -m "feat: implement login and password recovery modules"

# 21. Checkout & Seat Purchase flow
if (Test-Path "app/(public)/compra") { git add app/\(public\)/compra/ }
git commit -m "feat: implement interactive seat selection and checkout flow"

# 22. Customer profile page
if (Test-Path "app/(public)/perfil") { git add app/\(public\)/perfil/ }
git commit -m "feat: implement customer profile and purchase history"

# 23. Complaints book page
if (Test-Path "app/(public)/reclamaciones") { git add app/\(public\)/reclamaciones/ }
git commit -m "feat: implement online complaints book module"

# 24. API Documentation page
if (Test-Path "app/(public)/docs") { git add app/\(public\)/docs/ }
git commit -m "feat: implement API documentation and Swagger viewer"

# 25. Admin dashboard
git add app/\(admin\)/layout.tsx
if (Test-Path "app/(admin)/admin") { git add app/\(admin\)/admin/ }
git commit -m "feat: implement admin dashboard and metric overview"

# 26. Admin management modules
git add app/\(admin\)/
git commit -m "feat: implement admin management for trips, routes, buses, and branches"

# 27. Operario QR boarding module
git add app/staff/operario/
git commit -m "feat: implement operario QR boarding scanner panel"

# 28. Conductor module & Staff layout
git add app/staff/
git commit -m "feat: implement conductor voyage manifesto and staff navigation"

# 29. Unit tests & backup script
git add scripts/
git commit -m "test: add unit test suites and database backup script"

# 30. Documentation
git add DOCUMENTACION_TECNICA.md README.md
git commit -m "docs: update technical documentation and comprehensive README"

# Final step: set remote and push
git branch -M main
git remote add origin $remoteUrl
git push -u origin main
