# 🎲 TimerRubikWeb

A modern web-based speedcubing timer application built with React 19, TypeScript, and Tailwind CSS. [1](#1-0) 

## ✨ Key Features

- ⏱️ **Precision Timer** - Accurate timing for solve measurements
- 🔀 **Automatic Scramble Generation** - WCA standard notation scrambles [2](#1-1) 
- 📊 **Advanced Statistics** - Ao5, Ao12, Ao50, and Ao100 averages [3](#1-2) 
- 📝 **Time History** - Interactive table with deletion options
- 📈 **Data Visualization** - Performance charts with Chart.js [4](#1-3) 

## 🛠️ Tech Stack

**Frontend:**
- ⚛️ React 19 with TypeScript for type safety [5](#1-4) 
- 🎨 Tailwind CSS for utility-first styling [6](#1-5) 
- 🐻 Zustand for lightweight state management [7](#1-6) 

**UI Components:**
- 🎯 Material UI & PrimeReact for advanced components [8](#1-7) 
- 📊 Chart.js for data visualization [9](#1-8) 
- 🎨 Radix UI & Tabler icons [10](#1-9) 

**Development Tools:**
- ⚡ Vite as build tool and dev server [11](#1-10) 
- 🔍 ESLint for code quality [12](#1-11) 

## 🏗️ Architecture

The application follows a clean React component architecture with clear separation of concerns:

```
src/
├── 📱 App.tsx              # Root component with main layout
├── 🧩 components/
│   ├── 🏠 Header.tsx       # Logo and scramble display
│   ├── 🎯 Main.tsx         # 3-column grid layout
│   ├── ⏱️ Timer.tsx        # Timer interface
│   ├── 📊 Averages.tsx     # Statistics and averages
│   ├── 📝 List.tsx         # Time history
│   └── 📋 Table.tsx        # Data table
├── 🗄️ store/
│   ├── ⏱️ timerStore.ts    # Timer state
│   └── 🔀 scrambleStore.ts # Scramble state
└── 🔧 services/
    └── 🛠️ Utils.tsx        # Scramble generation
```

## 🚀 Installation & Usage

```bash
# 📦 Install dependencies
npm install

# 🔥 Run in development
npm run dev

# 🏗️ Build for production
npm run build

# 👀 Preview build
npm run preview

# 🔍 Linting
npm run lint
```

## 📜 Available Scripts

- `npm run dev` - 🔥 Start development server with Vite [13](#1-12) 
- `npm run build` - 🏗️ Build application for production [14](#1-13) 
- `npm run preview` - 👀 Preview production build [15](#1-14) 
- `npm run lint` - 🔍 Run ESLint for code quality checks [12](#1-11) 

## 🎲 Scramble System Features

The system generates 20-move scrambles using WCA standard notation, preventing consecutive moves on the same face or axis. <cite/> Scrambles include all six cube faces (F, U, R, D, L, B) with standard modifiers (normal, 2, '). <cite/>

## 🎨 Icon System

The application uses a centralized SVG sprite system for efficient icon management: [16](#1-15) 

- 🔄 Reload icon for new scrambles [17](#1-16) 
- 🗑️ Trash icon for deletion functionality [18](#1-17) 
- 📱 Social media icons (GitHub, Instagram) [19](#1-18) 

## 📊 Statistics & Analytics

The app calculates comprehensive speedcubing metrics: [20](#1-19) 

- 🏆 **Personal Best (PB)** - Fastest single solve
- 📈 **Average of 5 (Ao5)** - Best 3 of last 5 solves
- 📊 **Average of 12 (Ao12)** - Best 10 of last 12 solves
- 📉 **Average of 50/100** - Extended averages for long-term tracking

## 🎯 Timer Interface

The timer uses sophisticated keyboard controls with visual feedback: [21](#1-20) 

- **🔥 Preparation Phase**: Hold spacebar for 8 key repeats to arm timer
- **▶️ Start Phase**: Release spacebar to begin timing
- **⏹️ Stop Phase**: Press any key to stop timer

**Notes**

The application uses distributed Zustand stores for optimal performance, with separate state domains for timer, scrambles, and times. <cite/> The main layout employs CSS Grid with 3 columns to organize core functionalities. <cite/> The time table includes individual deletion functionality with interactive icons from the sprite system. [18](#1-17) 
