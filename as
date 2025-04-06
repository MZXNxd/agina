<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MZXN | Advanced Roblox Executor</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/three@0.132.2/build/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/three@0.132.2/examples/js/controls/OrbitControls.js"></script>
    <style>
        :root {
            --bg-dark: #111111;
            --bg-light: #f8f9fa;
            --bg-gray: #2d2d2d;
            --bg-purple: #4a1d96;
            --text-primary: #e0e0e0;
            --text-secondary: #b0b0b0;
            --accent: #8b5cf6;
        }
        
        body {
            background-color: var(--bg-dark);
            color: var(--text-primary);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            transition: all 0.3s ease;
            overflow-x: hidden;
        }
        
        body.light-mode {
            background-color: var(--bg-light);
            color: #333;
            --text-primary: #333;
            --text-secondary: #555;
        }
        
        body.gray-mode {
            background-color: var(--bg-gray);
        }
        
        body.purple-mode {
            background-color: var(--bg-purple);
        }
        
        body.black-mode {
            background-color: #000;
        }
        
        .theme-btn {
            width: 24px;
            height: 24px;
            border-radius: 50%;
            cursor: pointer;
            border: 2px solid rgba(255,255,255,0.2);
            transition: transform 0.2s;
        }
        
        .theme-btn:hover {
            transform: scale(1.1);
        }
        
        .executor-card {
            background: rgba(20, 20, 20, 0.8);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
            transition: all 0.3s ease;
        }
        
        body.light-mode .executor-card {
            background: rgba(255, 255, 255, 0.9);
            border: 1px solid rgba(0,0,0,0.1);
        }
        
        .feature-card {
            background: rgba(30, 30, 30, 0.6);
            transition: all 0.3s ease;
        }
        
        body.light-mode .feature-card {
            background: rgba(255, 255, 255, 0.7);
        }
        
        .download-btn {
            background: linear-gradient(135deg, var(--accent), #7e22ce);
            transition: all 0.3s ease;
        }
        
        .download-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(139, 92, 246, 0.3);
        }
        
        .discord-btn {
            background: #5865F2;
            transition: all 0.3s ease;
        }
        
        .discord-btn:hover {
            background: #4752c4;
        }
        
        #executor-model {
            width: 100%;
            height: 300px;
            background: rgba(0,0,0,0.3);
            border-radius: 8px;
            overflow: hidden;
        }
        
        .nav-link {
            position: relative;
        }
        
        .nav-link::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--accent);
            transition: width 0.3s ease;
        }
        
        .nav-link:hover::after {
            width: 100%;
        }
        
        .tab-content {
            display: none;
        }
        
        .tab-content.active {
            display: block;
            animation: fadeIn 0.5s ease;
        }
        
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .stat-card {
            background: rgba(40, 40, 40, 0.6);
            transition: all 0.3s ease;
        }
        
        body.light-mode .stat-card {
            background: rgba(240, 240, 240, 0.8);
        }
        
        .tooltip {
            position: relative;
        }
        
        .tooltip-text {
            visibility: hidden;
            width: 120px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 6px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            transform: translateX(-50%);
            opacity: 0;
            transition: opacity 0.3s;
        }
        
        .tooltip:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
        }

        /* Animation classes */
        .slide-in-left {
            animation: slideInLeft 0.8s ease-out forwards;
        }
        
        .slide-in-right {
            animation: slideInRight 0.8s ease-out forwards;
        }
        
        .slide-in-bottom {
            animation: slideInBottom 0.8s ease-out forwards;
        }
        
        .float {
            animation: float 3s ease-in-out infinite;
        }
        
        .pulse {
            animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
        }
        
        .spin {
            animation: spin 1s linear infinite;
        }
        
        @keyframes slideInLeft {
            from { transform: translateX(-100px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        @keyframes slideInRight {
            from { transform: translateX(100px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
        
        @keyframes slideInBottom {
            from { transform: translateY(100px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }
        
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }
        
        @keyframes pulse {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.5; }
        }
        
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .delay-1 {
            animation-delay: 0.2s;
        }
        
        .delay-2 {
            animation-delay: 0.4s;
        }
        
        .delay-3 {
            animation-delay: 0.6s;
        }
        
        .delay-4 {
            animation-delay: 0.8s;
        }
        
        .delay-5 {
            animation-delay: 1s;
        }
        
        .glow {
            text-shadow: 0 0 10px rgba(139, 92, 246, 0.7);
        }
        
        .btn-glow:hover {
            box-shadow: 0 0 15px rgba(139, 92, 246, 0.7);
        }
    </style>
</head>
<body class="min-h-screen">
    <!-- Header -->
    <header class="py-4 px-6 border-b border-gray-800 slide-in-bottom">
        <div class="container mx-auto flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <div class="w-8 h-8 bg-purple-600 rounded-full flex items-center justify-center glow">
                    <i class="fas fa-bolt text-white"></i>
                </div>
                <h1 class="text-xl font-bold">MZ<span class="text-purple-400">XN</span></h1>
            </div>
            
            <nav class="hidden md:flex space-x-8">
                <a href="#home" class="nav-link">Home</a>
                <a href="#features" class="nav-link">Features</a>
                <a href="#download" class="nav-link">Download</a>
                <a href="#stats" class="nav-link">Stats</a>
                <a href="#faq" class="nav-link">FAQ</a>
            </nav>
            
            <div class="flex items-center space-x-4">
                <a href="https://discord.gg/mW7D5cfYNt" target="_blank" class="discord-btn px-4 py-2 rounded-md flex items-center btn-glow">
                    <i class="fab fa-discord mr-2"></i> Discord
                </a>
                
                <div class="flex space-x-2">
                    <div class="theme-btn bg-gray-800" data-theme="dark"></div>
                    <div class="theme-btn bg-gray-300" data-theme="light"></div>
                    <div class="theme-btn bg-gray-500" data-theme="gray"></div>
                    <div class="theme-btn bg-purple-800" data-theme="purple"></div>
                    <div class="theme-btn bg-black" data-theme="black"></div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">
        <!-- Hero Section -->
        <section id="home" class="mb-16">
            <div class="flex flex-col lg:flex-row items-center justify-between">
                <div class="lg:w-1/2 mb-8 lg:mb-0 slide-in-left delay-1">
                    <h2 class="text-4xl md:text-5xl font-bold mb-4">Advanced <span class="text-purple-400 glow">Roblox</span> Executor</h2>
                    <p class="text-lg text-gray-400 mb-6">MZXN v4 is the most powerful and reliable Roblox exploit with unmatched execution capabilities and advanced features for professional scripters.</p>
                    
                    <div class="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
                        <a href="https://github.com/MZXNxd/MZXN/raw/main/Bootstrapper.rar" class="download-btn px-6 py-3 rounded-md font-medium flex items-center justify-center btn-glow">
                            <i class="fas fa-download mr-2"></i> Download v4.0.0
                        </a>
                        <button class="border border-purple-400 text-purple-400 px-6 py-3 rounded-md font-medium hover:bg-purple-400 hover:text-white transition btn-glow">
                            <i class="fas fa-book mr-2"></i> Documentation
                        </button>
                    </div>
                    
                    <div class="mt-8 flex items-center space-x-4">
                        <div class="flex items-center">
                            <i class="fas fa-check-circle text-green-400 mr-2 pulse"></i>
                            <span>Undetected</span>
                        </div>
                        <div class="flex items-center">
                            <i class="fas fa-bolt text-yellow-400 mr-2 pulse"></i>
                            <span>Fast Execution</span>
                        </div>
                        <div class="flex items-center">
                            <i class="fas fa-shield-alt text-purple-400 mr-2 pulse"></i>
                            <span>Secure</span>
                        </div>
                    </div>
                </div>
                
                <div class="lg:w-1/2 slide-in-right delay-1">
                    <div id="executor-model" class="relative float">
                        <!-- 3D Model will be rendered here -->
                        <div class="absolute inset-0 flex items-center justify-center">
                            <div class="text-center">
                                <i class="fas fa-bolt text-4xl text-purple-500 mb-2 spin"></i>
                                <p class="text-gray-400">Executor 3D Model</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section id="features" class="mb-16">
            <h2 class="text-3xl font-bold mb-8 text-center slide-in-bottom">Powerful <span class="text-purple-400 glow">Features</span></h2>
            
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                <!-- Feature 1 -->
                <div class="feature-card p-6 rounded-lg slide-in-left delay-1 hover:transform hover:scale-105 transition">
                    <div class="w-12 h-12 bg-purple-900 bg-opacity-30 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-bolt text-purple-400 text-xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Lightning Fast</h3>
                    <p class="text-gray-400">Optimized execution engine delivers instant script injection with minimal overhead.</p>
                </div>
                
                <!-- Feature 2 -->
                <div class="feature-card p-6 rounded-lg slide-in-bottom delay-2 hover:transform hover:scale-105 transition">
                    <div class="w-12 h-12 bg-purple-900 bg-opacity-30 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-shield-alt text-purple-400 text-xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Advanced Protection</h3>
                    <p class="text-gray-400">Built-in anti-detection and anti-ban systems keep you safe while exploiting.</p>
                </div>
                
                <!-- Feature 3 -->
                <div class="feature-card p-6 rounded-lg slide-in-right delay-1 hover:transform hover:scale-105 transition">
                    <div class="w-12 h-12 bg-purple-900 bg-opacity-30 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-code text-purple-400 text-xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Lua 5.1 Support</h3>
                    <p class="text-gray-400">Full Lua 5.1 implementation with extensions for Roblox-specific functionality.</p>
                </div>
                
                <!-- Feature 4 -->
                <div class="feature-card p-6 rounded-lg slide-in-left delay-2 hover:transform hover:scale-105 transition">
                    <div class="w-12 h-12 bg-purple-900 bg-opacity-30 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-rocket text-purple-400 text-xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Multi-Threading</h3>
                    <p class="text-gray-400">Execute multiple scripts simultaneously with our advanced multi-threading system.</p>
                </div>
                
                <!-- Feature 5 -->
                <div class="feature-card p-6 rounded-lg slide-in-bottom delay-3 hover:transform hover:scale-105 transition">
                    <div class="w-12 h-12 bg-purple-900 bg-opacity-30 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-database text-purple-400 text-xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Script Hub</h3>
                    <p class="text-gray-400">Built-in script hub with hundreds of pre-made scripts for popular games.</p>
                </div>
                
                <!-- Feature 6 -->
                <div class="feature-card p-6 rounded-lg slide-in-right delay-2 hover:transform hover:scale-105 transition">
                    <div class="w-12 h-12 bg-purple-900 bg-opacity-30 rounded-full flex items-center justify-center mb-4">
                        <i class="fas fa-wifi text-purple-400 text-xl"></i>
                    </div>
                    <h3 class="text-xl font-semibold mb-2">Auto Updates</h3>
                    <p class="text-gray-400">Automatic updates ensure you always have the latest features and protections.</p>
                </div>
            </div>
        </section>

        <!-- Download Section -->
        <section id="download" class="mb-16">
            <div class="executor-card rounded-xl p-8 slide-in-bottom delay-2">
                <h2 class="text-3xl font-bold mb-6 text-center">Download <span class="text-purple-400 glow">MZXN</span></h2>
                
                <div class="max-w-2xl mx-auto">
                    <!-- Windows Download -->
                    <div class="p-6 rounded-lg border border-gray-700 hover:border-purple-400 transition slide-in-left delay-3 hover:transform hover:scale-102">
                        <div class="flex items-center mb-4">
                            <i class="fab fa-windows text-purple-400 text-2xl mr-3"></i>
                            <h3 class="text-xl font-semibold">Windows</h3>
                        </div>
                        <p class="text-gray-400 mb-4">Compatible with Windows 10/11 (64-bit only)</p>
                        <a href="https://github.com/MZXNxd/MZXN/raw/main/Bootstrapper.rar" class="download-btn px-4 py-2 rounded-md w-full btn-glow flex items-center justify-center">
                            <i class="fas fa-download mr-2"></i> Download (v4.0.0)
                        </a>
                        <div class="mt-3 text-sm text-gray-500">
                            <i class="fas fa-file-archive mr-1"></i> 69 MB .rar
                        </div>
                    </div>
                </div>
                
                <div class="mt-8">
                    <h3 class="text-xl font-semibold mb-4 slide-in-bottom delay-3">Installation Instructions</h3>
                    <div class="bg-gray-900 rounded-lg p-4 slide-in-bottom delay-4">
                        <div class="flex border-b border-gray-700 mb-4">
                            <button class="tab-button px-4 py-2 font-medium active" data-tab="windows">Windows</button>
                        </div>
                        
                        <div id="windows" class="tab-content active">
                            <ol class="list-decimal pl-5 space-y-2">
                                <li>Download the Windows .rar file</li>
                                <li>Extract the contents using WinRAR or 7-Zip</li>
                                <li>Run MZXN.exe (may require admin privileges)</li>
                                <li>Allow through Windows Defender if prompted</li>
                                <li>Launch Roblox and inject using the UI</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <section id="stats" class="mb-16">
            <h2 class="text-3xl font-bold mb-8 text-center slide-in-bottom">MZXN <span class="text-purple-400 glow">Statistics</span></h2>
            
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                <div class="stat-card p-6 rounded-lg text-center slide-in-left delay-1 hover:transform hover:scale-105 transition">
                    <div class="text-5xl font-bold text-purple-400 mb-2">10,000+</div>
                    <div class="text-gray-400">Downloads</div>
                </div>
                
                <div class="stat-card p-6 rounded-lg text-center slide-in-bottom delay-2 hover:transform hover:scale-105 transition">
                    <div class="text-5xl font-bold text-green-400 mb-2">99.9%</div>
                    <div class="text-gray-400">Uptime</div>
                </div>
                
                <div class="stat-card p-6 rounded-lg text-center slide-in-right delay-1 hover:transform hover:scale-105 transition">
                    <div class="text-5xl font-bold text-purple-400 mb-2">2025</div>
                    <div class="text-gray-400">Release Year</div>
                </div>
            </div>
            
            <div class="mt-8 executor-card p-6 rounded-lg slide-in-bottom delay-3">
                <h3 class="text-xl font-semibold mb-4">Version History</h3>
                <div class="overflow-x-auto">
                    <table class="w-full">
                        <thead>
                            <tr class="border-b border-gray-700">
                                <th class="text-left py-2">Version</th>
                                <th class="text-left py-2">Release Date</th>
                                <th class="text-left py-2">Changes</th>
                                <th class="text-left py-2">Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="border-b border-gray-700">
                                <td class="py-3">v4.0.0</td>
                                <td>2025-03-20</td>
                                <td>Complete rewrite, new UI, improved performance</td>
                                <td><span class="bg-green-900 bg-opacity-30 text-green-400 px-2 py-1 rounded text-sm">Stable</span></td>
                            </tr>
                            <tr class="border-b border-gray-700">
                                <td class="py-3">v3.2.1</td>
                                <td>2025-02-15</td>
                                <td>Bug fixes, stability improvements</td>
                                <td><span class="bg-gray-900 text-gray-400 px-2 py-1 rounded text-sm">Archived</span></td>
                            </tr>
                            <tr class="border-b border-gray-700">
                                <td class="py-3">v3.1.0</td>
                                <td>2025-01-30</td>
                                <td>Added script hub, performance improvements</td>
                                <td><span class="bg-gray-900 text-gray-400 px-2 py-1 rounded text-sm">Archived</span></td>
                            </tr>
                            <tr>
                                <td class="py-3">v3.0.0</td>
                                <td>2025-01-10</td>
                                <td>Initial v3 release</td>
                                <td><span class="bg-gray-900 text-gray-400 px-2 py-1 rounded text-sm">Archived</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>

        <!-- FAQ Section -->
        <section id="faq" class="mb-16">
            <h2 class="text-3xl font-bold mb-8 text-center slide-in-bottom">Frequently <span class="text-purple-400 glow">Asked Questions</span></h2>
            
            <div class="executor-card rounded-xl p-8 slide-in-bottom delay-1">
                <div class="space-y-4">
                    <div class="border-b border-gray-700 pb-4">
                        <h3 class="text-xl font-semibold mb-2 flex items-center justify-between cursor-pointer">
                            <span>Is MZXN safe to use?</span>
                            <i class="fas fa-chevron-down text-purple-400"></i>
                        </h3>
                        <p class="text-gray-400 mt-2 hidden">MZXN employs advanced anti-detection techniques and is regularly updated to ensure safety. However, using any exploit carries inherent risks. We recommend using an alternate account and not exploiting in games where you have valuable items.</p>
                    </div>
                    
                    <div class="border-b border-gray-700 pb-4">
                        <h3 class="text-xl font-semibold mb-2 flex items-center justify-between cursor-pointer">
                            <span>Will MZXN get me banned?</span>
                            <i class="fas fa-chevron-down text-purple-400"></i>
                        </h3>
                        <p class="text-gray-400 mt-2 hidden">While MZXN has sophisticated anti-ban systems, no exploit can guarantee 100% safety from bans. The risk depends on how you use it and in which games. Avoid obvious cheating in competitive games to minimize risk.</p>
                    </div>
                    
                    <div class="border-b border-gray-700 pb-4">
                        <h3 class="text-xl font-semibold mb-2 flex items-center justify-between cursor-pointer">
                            <span>What makes MZXN better than other executors?</span>
                            <i class="fas fa-chevron-down text-purple-400"></i>
                        </h3>
                        <p class="text-gray-400 mt-2 hidden">MZXN offers superior execution speed, more stable API hooks, better memory management, and regular updates. Our custom Lua engine provides better compatibility with complex scripts compared to standard executors.</p>
                    </div>
                    
                    <div class="border-b border-gray-700 pb-4">
                        <h3 class="text-xl font-semibold mb-2 flex items-center justify-between cursor-pointer">
                            <span>How often is MZXN updated?</span>
                            <i class="fas fa-chevron-down text-purple-400"></i>
                        </h3>
                        <p class="text-gray-400 mt-2 hidden">We release updates every 2-4 weeks on average, with emergency patches for critical issues within 24-48 hours. Major updates with new features come every 2-3 months.</p>
                    </div>
                    
                    <div class="pb-4">
                        <h3 class="text-xl font-semibold mb-2 flex items-center justify-between cursor-pointer">
                            <span>Can I request features for MZXN?</span>
                            <i class="fas fa-chevron-down text-purple-400"></i>
                        </h3>
                        <p class="text-gray-400 mt-2 hidden">Yes! Join our Discord server to suggest features. Popular requests are prioritized for future updates. We've implemented over 30 community-suggested features so far.</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <footer class="border-t border-gray-800 py-8 slide-in-bottom delay-2">
        <div class="container mx-auto px-4">
            <div class="flex flex-col md:flex-row justify-between items-center">
                <div class="mb-4 md:mb-0">
                    <div class="flex items-center space-x-2">
                        <div class="w-8 h-8 bg-purple-600 rounded-full flex items-center justify-center glow">
                            <i class="fas fa-bolt text-white"></i>
                        </div>
                        <h1 class="text-xl font-bold">MZ<span class="text-purple-400">XN</span></h1>
                    </div>
                    <p class="text-gray-400 mt-2">The most advanced Roblox executor</p>
                </div>
                
                <div class="flex space-x-6">
                    <a href="https://discord.gg/mW7D5cfYNt" target="_blank" class="text-gray-400 hover:text-purple-400 transition">
                        <i class="fab fa-discord text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">
                        <i class="fab fa-twitter text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">
                        <i class="fab fa-youtube text-xl"></i>
                    </a>
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">
                        <i class="fab fa-github text-xl"></i>
                    </a>
                </div>
            </div>
            
            <div class="mt-8 pt-8 border-t border-gray-800 flex flex-col md:flex-row justify-between">
                <div class="mb-4 md:mb-0">
                    <p class="text-gray-400">© 2025 MZXN. All rights reserved.</p>
                    <p class="text-gray-500 text-sm mt-1">Not affiliated with Roblox Corporation.</p>
                </div>
                
                <div class="flex flex-col md:flex-row md:space-x-8 space-y-2 md:space-y-0">
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">Terms of Service</a>
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">Privacy Policy</a>
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">Refund Policy</a>
                    <a href="#" class="text-gray-400 hover:text-purple-400 transition">Contact Us</a>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Theme switcher
        document.querySelectorAll('.theme-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                const theme = btn.getAttribute('data-theme');
                document.body.className = theme + '-mode';
            });
        });
        
        // Tab system
        document.querySelectorAll('.tab-button').forEach(btn => {
            btn.addEventListener('click', () => {
                const tabId = btn.getAttribute('data-tab');
                
                // Remove active class from all buttons and tabs
                document.querySelectorAll('.tab-button').forEach(b => b.classList.remove('active'));
                document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
                
                // Add active class to clicked button and corresponding tab
                btn.classList.add('active');
                document.getElementById(tabId).classList.add('active');
            });
        });
        
        // FAQ accordion
        document.querySelectorAll('#faq h3').forEach(question => {
            question.addEventListener('click', () => {
                const answer = question.nextElementSibling;
                const icon = question.querySelector('i');
                
                if (answer.classList.contains('hidden')) {
                    answer.classList.remove('hidden');
                    icon.classList.remove('fa-chevron-down');
                    icon.classList.add('fa-chevron-up');
                } else {
                    answer.classList.add('hidden');
                    icon.classList.remove('fa-chevron-up');
                    icon.classList.add('fa-chevron-down');
                }
            });
        });
        
        // Initialize 3D model (simplified placeholder)
        function init3DModel() {
            const container = document.getElementById('executor-model');
            const width = container.clientWidth;
            const height = container.clientHeight;
            
            // Create scene
            const scene = new THREE.Scene();
            scene.background = new THREE.Color(0x111111);
            
            // Create camera
            const camera = new THREE.PerspectiveCamera(75, width / height, 0.1, 1000);
            camera.position.z = 5;
            
            // Create renderer
            const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
            renderer.setSize(width, height);
            container.innerHTML = '';
            container.appendChild(renderer.domElement);
            
            // Add controls
            const controls = new THREE.OrbitControls(camera, renderer.domElement);
            controls.enableZoom = false;
            controls.enablePan = false;
            controls.autoRotate = true;
            controls.autoRotateSpeed = 1.5;
            
            // Add lights
            const ambientLight = new THREE.AmbientLight(0x404040);
            scene.add(ambientLight);
            
            const directionalLight = new THREE.DirectionalLight(0x8b5cf6, 0.8);
            directionalLight.position.set(1, 1, 1);
            scene.add(directionalLight);
            
            // Create executor model (simplified cube for demo)
            const geometry = new THREE.BoxGeometry(2, 1, 0.2);
            const edges = new THREE.EdgesGeometry(geometry);
            const line = new THREE.LineSegments(
                edges,
                new THREE.LineBasicMaterial({ color: 0x8b5cf6 })
            );
            
            const material = new THREE.MeshPhongMaterial({
                color: 0x111111,
                emissive: 0x111111,
                specular: 0x8b5cf6,
                shininess: 30,
                transparent: true,
                opacity: 0.9
            });
            
            const cube = new THREE.Mesh(geometry, material);
            scene.add(cube);
            scene.add(line);
            
            // Add screen effect
            const screenGeometry = new THREE.PlaneGeometry(1.8, 0.8);
            const screenMaterial = new THREE.MeshBasicMaterial({
                color: 0x8b5cf6,
                emissive: 0x8b5cf6,
                transparent: true,
                opacity: 0.3
            });
            const screen = new THREE.Mesh(screenGeometry, screenMaterial);
            screen.position.z = 0.11;
            cube.add(screen);
            
            // Add MZXN logo to screen
            const logoGeometry = new THREE.PlaneGeometry(1.5, 0.5);
            const logoMaterial = new THREE.MeshBasicMaterial({
                color: 0x8b5cf6,
                transparent: true,
                opacity: 0.8,
                side: THREE.DoubleSide
            });
            const logo = new THREE.Mesh(logoGeometry, logoMaterial);
            logo.position.z = 0.12;
            cube.add(logo);
            
            // Add bolt icon
            const boltShape = new THREE.Shape();
            boltShape.moveTo(0, 0.5);
            boltShape.lineTo(0.3, 0.5);
            boltShape.lineTo(0.15, 0);
            boltShape.lineTo(0.45, 0);
            boltShape.lineTo(0.3, -0.5);
            boltShape.lineTo(0, -0.5);
            boltShape.lineTo(0.15, 0);
            boltShape.lineTo(0, 0.5);
            
            const boltGeometry = new THREE.ShapeGeometry(boltShape);
            const boltMaterial = new THREE.MeshBasicMaterial({
                color: 0x8b5cf6,
                side: THREE.DoubleSide
            });
            const bolt = new THREE.Mesh(boltGeometry, boltMaterial);
            bolt.scale.set(0.5, 0.5, 0.5);
            bolt.position.z = 0.13;
            cube.add(bolt);
            
            // Animation loop
            function animate() {
                requestAnimationFrame(animate);
                controls.update();
                renderer.render(scene, camera);
            }
            
            animate();
            
            // Handle resize
            window.addEventListener('resize', () => {
                const width = container.clientWidth;
                const height = container.clientHeight;
                
                camera.aspect = width / height;
                camera.updateProjectionMatrix();
                
                renderer.setSize(width, height);
            });
        }
        
        // Initialize when page loads
        window.addEventListener('load', () => {
            init3DModel();
            
            // Simulate loading delay for 3D model
            setTimeout(() => {
                document.getElementById('executor-model').style.background = 'transparent';
            }, 500);

            // Add animation classes to elements as they come into view
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('animated');
                    }
                });
            }, {
                threshold: 0.1
            });

            document.querySelectorAll('.slide-in-left, .slide-in-right, .slide-in-bottom').forEach(el => {
                observer.observe(el);
            });
        });
        
        // Download buttons
        document.querySelectorAll('.download-btn').forEach(btn => {
            btn.addEventListener('click', () => {
                // Add to download stats animation
                const stats = document.querySelector('.stat-card:first-child div:first-child');
                let current = parseInt(stats.textContent.replace(/\D/g, ''));
                const target = current + 1;
                
                const interval = setInterval(() => {
                    current += Math.ceil((target - current) / 10);
                    stats.textContent = current.toLocaleString() + '+';
                    
                    if (current >= target) {
                        clearInterval(interval);
                        stats.textContent = target.toLocaleString() + '+';
                    }
                }, 30);
            });
        });
        
        // Tooltips
        document.querySelectorAll('.tooltip').forEach(el => {
            el.addEventListener('mouseenter', () => {
                const tooltip = el.querySelector('.tooltip-text');
                tooltip.style.visibility = 'visible';
                tooltip.style.opacity = '1';
            });
            
            el.addEventListener('mouseleave', () => {
                const tooltip = el.querySelector('.tooltip-text');
                tooltip.style.visibility = 'hidden';
                tooltip.style.opacity = '0';
            });
        });
    </script>
</body>
</html>
