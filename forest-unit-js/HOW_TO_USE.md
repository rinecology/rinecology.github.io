# 📦 Distribution Package - For End Users

## 🎯 What This Is

This is the **ready-to-use** Forest Unit Analysis Tool web app. No installation required!

## 🚀 How to Use

### Method 1: Simple HTTP Server (Recommended)

**Requirements:**
- Python installed (most Windows 10/11 have it)
- Or Node.js installed

#### Option A: Using Python
1. Open PowerShell in this folder
2. Run:
   ```powershell
   python -m http.server 8000
   ```
3. Open browser to: **http://localhost:8000**

#### Option B: Using Node.js (npx)
1. Open PowerShell in this folder
2. Run:
   ```powershell
   npx serve
   ```
3. Open browser to the URL shown (usually http://localhost:3000)

### Method 2: VS Code Live Server (If you have VS Code)
1. Open this folder in VS Code
2. Right-click `index.html`
3. Select "Open with Live Server"

### Method 3: Direct File Access (Limited - Not Recommended)
- Double-click `index.html`
- ⚠️ **Note:** Some features may not work due to browser security restrictions

---

## 📁 What's Included

```
dist/
├── index.html          # Main application file
├── START_APP.bat       # Windows launcher (double-click to run)
├── START_APP.ps1       # PowerShell launcher
├── README.md           # End user guide
├── HOW_TO_USE.md       # This file
└── assets/
    ├── vendor-*.js     # Libraries (PapaParse, Lodash, Chart.js)
    ├── index-*.js      # Application code
    └── index-*.css     # Styles
```

**Everything is self-contained!** No internet connection needed after opening.

---

## 💡 For IT Departments

### Deploy to Network Share
```powershell
# Copy to shared drive
Copy-Item -Recurse * Z:\shared\forest-tool\

# Users access via:
# Start Python HTTP server in that folder, or
# Use IIS/Apache to serve the folder
```

### Deploy to IIS (Windows Server)
1. Copy `dist/` contents to IIS web folder
2. Create new website in IIS Manager
3. Point to the folder
4. Users access via: `http://your-server/forest-tool`

### Deploy to Apache/Nginx
Same as IIS - just copy files to web root.

---

## 🔒 Privacy Notice

**All processing happens in the user's browser.**
- ✅ No data is uploaded to any server
- ✅ CSV files are processed locally
- ✅ Results are generated in browser memory
- ✅ No external network requests (except initial page load)

---

## ❓ Troubleshooting

**Problem:** "Access-Control-Allow-Origin" error
**Solution:** Don't open index.html directly. Use HTTP server (Method 1)

**Problem:** Page loads but app doesn't work
**Solution:** Clear browser cache (Ctrl+Shift+Delete)

**Problem:** Can't upload files
**Solution:** Make sure you're using a modern browser (Chrome 90+, Edge 90+, Firefox 88+)

**Problem:** File size limit
**Solution:** Maximum file size is ~100 MB (browser memory limit). Split large files into smaller batches.

---

## 📞 Support

For technical support, contact: [your-contact-info]

Documentation: See README files in the repository

---

**Built for Ontario Ministry of Natural Resources and Forestry** 🌲🍁
