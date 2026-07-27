# 🚌 Empresa de Transportes "El Cumbe" — Plataforma Web

<div align="center">

![Next.js](https://img.shields.io/badge/Next.js_16-black?style=for-the-badge&logo=nextdotjs&logoColor=white)
![React](https://img.shields.io/badge/React_19-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![TypeScript](https://img.shields.io/badge/TypeScript_5-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS_v4-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
![Prisma](https://img.shields.io/badge/Prisma_ORM-2D3748?style=for-the-badge&logo=prisma&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

**Sistema Integral de Gestión, Venta de Pasajes Interprovinciales y Control de Abordaje QR**

[Características](#-características-principales) •
[Tecnologías](#-stack-tecnológico) •
[Instalación Rápida](#-instalación-y-configuración-rápida) •
[Credenciales de Prueba](#-usuarios-y-credenciales-de-prueba) •
[Estructura](#-estructura-del-proyecto) •
[Pruebas](#-pruebas-y-calidad)

</div>

---

## 📌 Visión General del Proyecto

La **Empresa de Transportes "El Cumbe"** cuenta con una plataforma web moderna diseñada para automatizar la venta presencial y en línea de boletos de viaje, la gestión de la flota de buses, rutas interprovinciales, encomiendas y el control de abordaje en tiempo real mediante escaneo de códigos QR.

El sistema resuelve problemas clave en la industria de transportes:
- ⚡ **Prevención de sobreventa (Race Conditions):** Bloqueo atómico temporal de asientos por 8 minutos durante el proceso de reserva/pago.
- 📲 **Abordaje Rápido mediante QR:** Generación de un código QR único por pasajero, escaneable por el operario desde cualquier navegador web/móvil.
- 🔐 **Seguridad RBAC:** Control de acceso granular por roles (Administrador, Gerente, Vendedor, Operario, Conductor y Cliente).

---

## 🌐 Características Principales

| Módulo / Dominio | Funcionalidades Destacadas |
| :--- | :--- |
| 🛒 **Portal Cliente (Público)** | • Búsqueda interactiva de viajes por origen, destino y fecha.<br>• Selección de asientos en tiempo real (Piso 1 y Piso 2).<br>• Pago seguro simulado con pasarela Culqi.<br>• Descarga de boletos PDF e historial de compras. |
| 🛠️ **Panel Administrativo (`/admin`)** | • Gestión completa de Sucursales, Flota de Buses, Rutas y Programación de Viajes.<br>• Reportes analíticos y métricas operativas.<br>• Gestión de usuarios y asignación de roles. |
| 📲 **Módulo de Abordaje (`/staff/operario`)** | • Escáner en tiempo real mediante cámara web/móvil (`html5-qrcode`).<br>• Validación instantánea de tickets y estado de abordaje.<br>• Opción de búsqueda manual por DNI o código de pasaje. |
| 🚚 **Bitácora de Conductor (`/staff/conductor`)** | • Visualización de manifiesto de pasajeros por viaje.<br>• Hoja de ruta y estado del vehículo. |
| 📑 **Comprobantes y Notificaciones** | • Generación automática de boletos en PDF (`jsPDF` + QR).<br>• Envío automático de confirmaciones por correo electrónico (`Resend API`). |

---

## 🛠️ Stack Tecnológico

### **Frontend & Framework Web**
* **Framework:** [Next.js 16](https://nextjs.org/) (App Router & Server Actions)
* **Librería UI:** [React 19](https://react.dev/)
* **Lenguaje:** [TypeScript 5](https://www.typescriptlang.org/)
* **Estilos:** [Tailwind CSS v4](https://tailwindcss.com/)
* **Iconos:** Lucide React & React Icons
* **Gráficos & Analítica:** Recharts

### **Backend & Base de Datos**
* **ORM:** [Prisma v6](https://www.prisma.io/)
* **Base de Datos:** PostgreSQL
* **Autenticación:** [NextAuth.js v4](https://next-auth.js.org/) (JWT + Cookies seguras + Soporte para túneles ngrok)
* **Validación:** Zod
* **Seguridad:** Bcrypt (hashing de contraseñas)

### **Integraciones & Servicios Ext**
* **Pasarela de Pago:** Culqi API (Entorno Sandbox)
* **Generación PDF:** jsPDF & QRCode
* **Envío de Emails:** Resend API
* **Túneles de Desarrollo:** ngrok (Resolución dinámica `x-forwarded-host`)

---

## 🚀 Instalación y Configuración Rápida

Elige la modalidad que mejor se adapte a tu entorno de desarrollo:

### 💡 Opción 1: Con Docker (Recomendado — No requiere PostgreSQL instalado)

Si dispones de **Docker Desktop**, puedes levantar el entorno completo (Base de Datos + Aplicación Web) en un solo comando:

```bash
# 1. Acceder al directorio del proyecto
cd app_WebCumbe

# 2. Levantar los servicios con Docker Compose
docker-compose up -d --build
```
> 📍 La aplicación estará disponible en `http://localhost:3000` con la base de datos lista en el puerto `5432`.

---

### 💻 Opción 2: Instalación Manual Local

Si prefieres ejecutar el proyecto utilizando un servidor PostgreSQL local:

#### 1. Instalar dependencias
```bash
cd app_WebCumbe
npm install
```

#### 2. Configurar el archivo `.env`
Crea un archivo `.env` en la raíz del proyecto (puedes basarte en `.env.example`):

```env
# Base de Datos PostgreSQL
DATABASE_URL="postgresql://postgres:tu_password@localhost:5432/elcumbe?schema=public"
DIRECT_URL="postgresql://postgres:tu_password@localhost:5432/elcumbe?schema=public"

# Autenticación
NEXTAUTH_SECRET="development_secret_key_32_characters_long"
NEXTAUTH_URL="http://localhost:3000"

# Pasarela Culqi (Sandbox)
NEXT_PUBLIC_CULQI_PUBLIC_KEY="pk_test_lkYsEtGV030Goa3V"
CULQI_SECRET_KEY="sk_test_Lr8ZyYy1HvncSGGz"
```

#### 3. Inicializar la Base de Datos
Crea una base de datos PostgreSQL llamada `elcumbe` y ejecuta:

```bash
# a. Generar esquema y tablas
npx prisma db push

# b. Poblar datos iniciales (sucursales, buses, rutas reales de Perú y usuarios por defecto)
npx tsx scripts/seed-initial.ts
```

#### 4. Ejecutar el servidor de desarrollo
```bash
npm run dev
```
Accede a `http://localhost:3000` en tu navegador.

---

## 🔒 Usuarios y Credenciales de Prueba

Al ejecutar el script de semillas (`seed-initial.ts`), se crean automáticamente los siguientes usuarios de prueba (Contraseña universal: **`1234`**):

| Rol | Correo Electrónico | Descripción de Acceso |
| :--- | :--- | :--- |
| 🔑 **Administrador** | `admin@cumbe.com` | Control total del sistema (`/admin`) |
| 💼 **Gerente** | `gerente@cumbe.com` | Reportes de ingresos y estadísticas |
| 🎟️ **Vendedor** | `vendedor@cumbe.com` | Venta presencial de pasajes en ventanilla |
| 📱 **Operario** | `operario@cumbe.com` | Escaneo QR y control de abordaje (`/staff/operario`) |
| 🚌 **Conductor** | `conductor@cumbe.com` | Manifiesto de viaje y pasajeros (`/staff/conductor`) |
| 👤 **Cliente** | `cliente@cumbe.com` | Portal de compras e historial personal |

---

## 📁 Estructura del Proyecto

```
app_WebCumbe/
├── 📁 app/                     # Next.js App Router
│   ├── 📁 (admin)/             # Rutas protegidas de Administración
│   ├── 📁 (public)/            # Portal web para clientes (Compra, Mi Perfil, Reclamaciones)
│   ├── 📁 api/                 # Endpoints REST y NextAuth AuthHandler
│   └── 📁 staff/               # Vistas optimizadas para Operarios y Conductores
├── 📁 components/              # Componentes reutilizables UI (Modales, Asientos, Tablas)
├── 📁 lib/                     # Cliente Prisma, Utilidades PDF, Helpers y Auth Config
├── 📁 prisma/                  # Esquema Prisma (`schema.prisma`)
├── 📁 public/                  # Recursos estáticos (Logos, imágenes de buses)
├── 📁 scripts/                 # Scripts de Seed, Pruebas Unitarias y Respaldos
├── 📄 proxy.ts                 # Middleware principal de seguridad (Control RBAC)
├── 📄 docker-compose.yml       # Orquestación de Docker
└── 📄 init_data.json           # Backup e información de semillas
```

---

## 🧪 Pruebas y Calidad de Código

El proyecto cuenta con una suite automatizada de pruebas para asegurar la calidad de las reglas de negocio:

```bash
# Ejecutar todas las pruebas unitarias e integración
npm test
```

### 📋 Aspectos Evaluados:
- ✅ **Validación de Identidad:** Formatos de DNI peruano (8 dígitos), Teléfono (9 dígitos) y correos.
- ✅ **Reglas de Compra:** Límite máximo de 6 asientos por transacción y cálculo correcto de importes.
- ✅ **Concurrencia Atómica:** Bloqueo de asientos con tiempo de caducidad para evitar compras duplicadas simultáneas.
- ✅ **Seguridad JWT:** Verificación de firma y roles en los tokens de sesión.

---

## 🌐 Pruebas Remotas con ngrok

Si deseas probar la plataforma desde dispositivos móviles externos o compartirla con tu equipo:

```bash
ngrok http 3000
```
El middleware del sistema detecta automáticamente los encabezados `x-forwarded-host` garantizando que los callbacks de autenticación y recursos funcionen sin problemas.

---

## 👥 Equipo de Desarrollo

Proyecto desarrollado por el **Grupo 3 — DAD B**:
* Empresa de Transportes "El Cumbe" — Todos los derechos reservados.

