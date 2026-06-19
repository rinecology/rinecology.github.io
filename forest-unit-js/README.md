# 🌲 Forest Unit Analysis Tool - End User Guide

**Quick Start for Non-Technical Users**

## ⚠️ Requirements

> **The app itself is 100% JavaScript — it runs entirely in your browser.**
> Python or Node.js is only needed to start a simple file server, because browsers block direct file access for security reasons. The app does not use Python in any way.

- **Windows 7 or later**
- **Modern web browser** — Chrome, Edge, Firefox, or Safari (2020 or newer)
- **One of the following** (to serve the files):
  - Python 3.x *(most government Windows machines have this pre-installed)*
  - Node.js *(alternative if Python is unavailable)*

To check if Python is installed, open PowerShell and type: `python --version`

## 🎯 Three Ways to Run This App

### ⭐ **Way 1: Double-Click START_APP.bat (Easiest!)**

1. **Double-click** `START_APP.bat` file
2. A browser window will open automatically
3. Start using the app!
4. When done, close the terminal window

**Requirements:** Python or Node.js (most computers already have one)

---

### 🌐 **Way 2: Deployed Website (Best for Teams)**

If your IT department has deployed this app, just:
1. Visit the URL they provided
2. Use the app directly in your browser
3. No setup needed!

**Example URLs:**
- `https://your-company.com/forest-tool`
- `http://sharepoint/forest-tool`

---

### 💻 **Way 3: Manual Server Start**

**If you have Python (most Windows 10/11 do):**
1. Open PowerShell in this folder
2. Type: `python -m http.server 8000`
3. Open browser to: `http://localhost:8000`

**If you have Node.js:**
1. Open PowerShell in this folder
2. Type: `npx serve`
3. Open browser to the URL shown

---

## 📖 How to Use the App

### Step 1: Upload Your CSV File
- **Drag and drop** your CSV file onto the upload zone
- Or click **"Browse Files"** to select it

### Step 2: Select Rule Sets
Check the rule sets you want to use:
- **One rule set** — normal processing (assigns forest units)
- **Two or more** — comparison mode (shows area changes between rule sets)

Use **Select All / Deselect All** to quickly toggle. You can also upload your own YAML rule file with the **Load YAML File** button.

### Step 3: Configure
- **Area Column** — auto-detected from your CSV (e.g., `AREA` in m², `HECTARES`). Choose "None" to use record count instead.
- **SPCOMP field name** — usually just "SPCOMP"

### Step 4: Process
- Click **"Process Data"** button
- Wait for processing to complete (progress bar shows status)

### Step 5: Download Results

**Single rule set:**
- **Download Results CSV** — your data with forest units assigned and individual species columns
- **Download HTML Report** — detailed report with charts and statistics

**Comparison mode (2+ rule sets):**
- **Diverging bar chart** — shows area gain/loss per SFU vs your chosen baseline
- **Delta table** — baseline area, comparison area, Δ ha, Δ% (green = gain, red = loss)
- **Download Comparison CSV** — summary with deltas per SFU
- **Download Full Results CSV** — all records with `FU_<ruleSetKey>` columns
- **Baseline selector** — switch baseline instantly, chart and table update

---

## 📁 What You Need

**Your CSV file must have:**
- A column with SPCOMP strings (species composition)
- Example: `"SB60BW40"` means 60% Black Spruce, 40% White Birch

**Optional columns** (used by some rule sets):
- `Age` - Stand age
- `OSC` - Overstory condition
- Other stand attributes

---

## ✅ What You'll Get

**Results CSV includes:**
- All your original columns
- Individual species percentage columns (e.g., `SB`, `BF`, `BW`, `LA`, etc.)
- `ForestUnit` - The assigned forest unit code
- `MatchedRule` - Which rule was used
- `RuleNumber` - The specific rule number that matched

**HTML Report includes:**
- Processing statistics and metadata
- Forest Unit distribution charts (pie and doughnut charts)
- Forest Unit area analysis (if area column exists)
- Top 6 species by forest unit (area-weighted averages with bar charts)
- Species composition analysis with diversity index
- Data quality assessment with recommendations
- Beautiful interactive Chart.js visualizations

---

## 🎨 Features

**Core Functionality:**
- ✅ Parse Ontario SPCOMP format (flexible and strict parsing)
- ✅ 7 bundled YAML rule sets with 122+ rules, loaded at startup
- ✅ Upload custom YAML rule files at runtime
- ✅ **YAML Tools** (⚙️ button in header):
  - Edit any bundled or custom rule set in a browser-based YAML editor
  - Validate YAML (syntax, schema, and expression eval) before use
  - Convert ArcGIS-style SQL rule sets to YAML:
    - **Python dict `.py` files** — paste or upload directly
    - **CSV two-column tables** (SFU | SQL) — paste or upload `.csv` / `.txt`
    - **Excel (`.xlsx`) is not supported** — open in Excel, then File → Save As → CSV UTF-8 first
  - Conversion warnings shown for skipped rules (e.g. post-classification refinement rules)
- ✅ Cross-rule-set comparison with diverging bar chart and delta table
- ✅ Area column auto-detection (AREA m², HECTARES, Shape_Area) with fallback to record count
- ✅ Individual species columns for detailed analysis
- ✅ Comprehensive HTML reports with interactive charts
- ✅ CSV export functionality
- ✅ Area-weighted species analysis
- ✅ Data quality validation and anomaly detection

**User Experience:**
- ✅ Ontario government branding with official logo
- ✅ About section with license and development info
- ✅ Drag-and-drop file upload
- ✅ Progress indicators
- ✅ 100% browser-based - no installation required
- ✅ Works offline after initial load

---

## 🔒 Privacy & Security

**Your data is 100% safe:**
- ✅ Everything happens in YOUR browser
- ✅ No files are uploaded to any server
- ✅ No internet connection needed (after first page load)
- ✅ Your data never leaves your computer

This is **client-side processing** - your data stays completely private!

---

## ❓ Common Questions

**Q: Do I need to install anything?**
A: No! Just need Python or Node.js (most computers already have one)

**Q: Does it work offline?**
A: Yes! After the page loads once, it works without internet

**Q: Is my data sent to a server?**
A: NO! Everything happens in your browser locally

**Q: Can I use this on a Mac or Linux?**
A: Yes! The app works on any operating system with a modern browser

**Q: What browsers work?**
A: Chrome, Edge, Firefox, Safari (version 2020 or newer)

**Q: Can I process multiple files?**
A: Process them one at a time. Batch processing is not currently supported.

**Q: Can I compare different rule sets?**
A: Yes! Check 2 or more rule sets, process, then pick a baseline. The app shows a bar chart and table of area changes per forest unit.

**Q: Can I use my own rule set?**
A: Yes! Two ways:
- **Quick load**: Click "Load YAML File" and upload a `.yml` file with your rules — it appears in the checklist immediately.
- **YAML Tools** (⚙️ button): Full modal for editing, validating, and converting rule sets.
  - *YAML Editor tab* — edit a bundled rule set or paste custom YAML, validate it, then "Use as Rule Set".
  - *SQL Converter tab* — convert an existing Python dict (`.py`) or CSV two-column table to YAML in one click.
  - **Note:** Excel (`.xlsx`) files are not supported directly. Open in Excel, then File → Save As → CSV (UTF-8), and upload the CSV.

**Q: What gets skipped during SQL conversion?**
A: Post-classification refinement rules that reference a prior Forest Unit assignment are not evaluable in the browser and are skipped with a warning. Ecosite `IN (...)` clauses are stripped from otherwise-convertible rules (also warned). All other SQL constructs convert automatically.

**Q: What if I get "UNASSIGNED" results?**
A: Some stands may not match any rule - this is normal. Check SPCOMP is valid.

**Q: What's the maximum file size?**
A: ~100 MB (browser memory limit). Split larger files into smaller batches.

---

## ❓ Frequently Asked Questions

### Why can't I just double-click index.html?

Modern web browsers have security rules that prevent websites from accessing files directly from your computer. This is called **CORS (Cross-Origin Resource Sharing)** policy and it protects you from malicious websites.

Our app needs to load data files from your uploads, which requires a "web server environment." The `START_APP.bat` launcher creates a tiny web server on your computer automatically.

**Think of it like this:**
- ❌ Double-clicking index.html = Opening a local file (browser blocks file access)
- ✅ Using START_APP.bat = Visiting a mini-website on your computer (browser allows it)

### What is Python http.server?

Python includes a built-in tool called `http.server` that can turn any folder into a simple web server. The launcher uses this to make the app work properly.

When you run `python -m http.server 8000`, Python creates a temporary web server at `http://localhost:8000`:
- **localhost** = Your own computer (nothing goes to the internet)
- **Port 8000** = A "door number" for the web server

**Don't worry!** Most Windows 10/11 computers already have Python installed, and the launcher handles everything automatically. You just double-click `START_APP.bat` and go!

### Is my data safe? Does it go to the internet?

**100% YES - Your data is completely safe!**

✅ All processing happens **in your browser** on your computer  
✅ No data is uploaded to any server or cloud service  
✅ CSV files are processed locally in browser memory  
✅ Results are generated entirely on your machine  
✅ The only network activity is loading the app itself (once)

**After the app loads, you can even disconnect from the internet and it will still work!**

### What if I don't have Python or Node.js?

**Option 1: Install Python (Recommended - 2 minutes)**
1. Visit https://www.python.org/downloads/
2. Download Python (any version 3.x)
3. Run installer - **check "Add to PATH"** ✅
4. Done! `START_APP.bat` will now work

**Option 2: Install Node.js**
1. Visit https://nodejs.org/
2. Download LTS version
3. Run installer with defaults
4. Done! `START_APP.bat` will now work

Most government computers already have Python pre-installed. To check, open PowerShell and type: `python --version`

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| **"Python not found"** | Install Python from https://www.python.org/downloads/ |
| **"Command not found"** | Install Node.js from https://nodejs.org/ |
| **"Can't upload file"** | Don't open index.html directly - use START_APP.bat |
| **"CORS error"** | Use HTTP server method (don't double-click index.html) |
| **Browser shows blank page** | Clear cache (Ctrl+Shift+Delete) and try again |
| **App is slow** | For large files (>100 MB), try splitting into smaller batches |

---

## 🎓 Sample Data

Test the app with these sample files (if provided):
- `inventory_sample.csv` - Small test file
- `NER_sample.csv` - Northeast Region example
- `GLSL_sample.csv` - Great Lakes example

---

## 📞 Need Help?

**For technical support:**
- Contact: [Your IT support contact]
- Email: [support email]

**For questions about forest units or rule sets:**
- Contact your regional forester
- See documentation in the repository

---

## 🎉 You're Ready!

1. Double-click `START_APP.bat`
2. Upload your CSV file
3. Check one or more rule sets
4. Process and download!
5. Compare rule sets by selecting 2+ and picking a baseline

**It's that simple!** 🌲🍁

---

**Built for Ontario Ministry of Natural Resources**

Version 1.0 | November 2025
