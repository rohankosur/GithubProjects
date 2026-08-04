import json
import re
import os

# Combined data from Krugman Textbook extraction
raw_data = r"""
UNIT 1: Basic Economic Concepts
Q: Absolute Advantage
A: RULE: The ability to produce more of a good or service than others using the same amount of resources. PROB: If US produces 100 cars and Japan produces 80 with the same labor, the US has absolute advantage. WORD: "Country X has an absolute advantage in Y because it can produce more units of Y with the same resources."
Q: Comparative Advantage
A: RULE: The ability to produce a good at a lower opportunity cost than others. FORM: Output Method: Other goes Over. Input Method: Other goes Under. WORD: "Country A has a comparative advantage in X because its opportunity cost of producing X is lower than Country B's."
Q: Opportunity Cost
A: RULE: The real cost of an item; what you must give up to get it. WORD: "The opportunity cost of choosing X is Y because Y is the next best alternative given up."
Q: Scarcity
A: RULE: The condition in which our wants are greater than our limited resources. WORD: "Because resources are limited, societies must make choices."

UNIT 2: Measuring Economic Performance
Q: Gross Domestic Product (GDP)
A: RULE: The total value of all final goods and services produced in an economy during a given period. FORM: GDP = C + I + G + (X - IM).
Q: Consumer Price Index (CPI)
A: RULE: Measures the cost of a market basket for a typical urban family. FORM: (Cost of Market Basket in current year / Cost in base year) * 100.
Q: Inflation Rate
A: RULE: The annual percent change in a price index. FORM: [(Price Index Year 2 - Price Index Year 1) / Price Index Year 1] * 100.
Q: Real Interest Rate
A: RULE: The nominal interest rate adjusted for inflation. FORM: Real Interest Rate = Nominal Interest Rate - Inflation Rate.
Q: GDP Deflator
A: RULE: A price measure equal to 100 times the ratio of nominal GDP to real GDP. FORM: 100 * (Nominal GDP / Real GDP).
Q: Unemployment Rate
A: RULE: The percentage of the total number of people in the labor force who are unemployed. FORM: (Unemployed / Labor Force) * 100.
Q: Natural Rate of Unemployment
A: RULE: The unemployment rate that arises from frictional plus structural unemployment. WORD: "The economy is at full employment when actual unemployment equals the natural rate."

UNIT 3: National Income and Price Determination
Q: Aggregate Demand (AD) Curve
A: RULE: Shows the relationship between the aggregate price level and the quantity of aggregate output demanded. WORD: "A decrease in price level increases purchasing power (wealth effect), increasing output demanded."
Q: Short-Run Aggregate Supply (SRAS)
A: RULE: Relationship between price level and quantity of output supplied when many production costs (wages) are fixed. WORD: "An increase in the price level leads to higher profits per unit, increasing output supplied in the short run."
Q: Stagflation
A: RULE: Combination of inflation and falling aggregate output. WORD: "Caused by a negative supply shock (leftward shift of SRAS), increasing prices and decreasing output."
Q: Multiplier Effect
A: RULE: The ratio of the total change in real GDP caused by an autonomous change in spending. FORM: Multiplier = 1 / (1 - MPC) or 1 / MPS.
Q: Tax Multiplier
A: RULE: The factor by which a change in taxes changes real GDP. FORM: -MPC / (1 - MPC) or -MPC / MPS.

UNIT 4: Financial Sector
Q: Bank Reserves
A: RULE: Currency held by banks in vaults plus deposits at the Federal Reserve. FORM: Reserves = Required Reserves + Excess Reserves.
Q: Money Multiplier
A: RULE: The ratio of the money supply to the monetary base. FORM: 1 / Reserve Ratio.
Q: Discount Rate
A: RULE: The interest rate the Federal Reserve charges on loans to banks. WORD: "Lowering the discount rate encourages bank borrowing, increasing the money supply."
Q: Open-Market Operation
A: RULE: The purchase or sale of government debt (Treasuries) by the Fed. WORD: "To increase money supply, the Fed buys Treasuries, increasing bank excess reserves."
Q: Loanable Funds Market
A: RULE: A hypothetical market where demand comes from borrowers and supply from lenders. WORD: "An increase in the budget deficit increases demand for loanable funds, raising real interest rates."

UNIT 5: Long-Run Consequences of Stabilization Policies
Q: Crowding Out
A: RULE: Occurs when government deficit spending drives up interest rates and reduces private investment. WORD: "Increased gov borrowing raises interest rates, which 'crowds out' private investment spending."
Q: Automatic Stabilizers
A: RULE: Spending/tax rules that automatically expand or contract with the business cycle. PROB: Unemployment insurance payments increase during a recession.

UNIT 6: Open Economy-International Trade and Finance
Q: Balance of Payments
A: RULE: A summary of a country's transactions with other countries. FORM: Current Account + Financial Account = 0.
Q: Foreign Exchange Market
A: RULE: The market in which currencies are traded. WORD: "An increase in demand for a currency causes it to appreciate; an increase in supply causes it to depreciate."
"""

tutorial_data = r"""
1. **Drawing AD/AS Shifts:** CALC: Shift AD right for expansionary policy. Shift SRAS left for negative supply shocks.
"""

frq_data = r"""
### 1. Fiscal vs Monetary Policy
WORD: "Fiscal policy uses G and T; Monetary policy uses Open Market Ops and interest rates."
"""

# Extract units
sections = re.split(r'(?:UNIT \d+: )', raw_data)
section_headers = re.findall(r'(?:UNIT \d+: )(.*?)(?:\n|$)', raw_data)

final_db = {}

def cleanup_latex(text):
    text = text.replace('$', '').replace('{', '').replace('}', '').replace('**', '').replace('*', '')
    return re.sub(r' +', ' ', text).strip()

def extract_field(text, tag):
    pattern = rf'{tag}: (.*?)(?= RULE:| FORM:| PROB:| WORD:| CALC:|$)'
    match = re.search(pattern, text, re.DOTALL)
    return cleanup_latex(match.group(1)) if match else "N/A"

for idx, (name, content) in enumerate(zip(section_headers, sections[1:])):
    branch = { "branch_name": name.strip(), "nodes": [] }
    qa_pairs = re.findall(r'Q: (.*?)\nA: (.*?)(?:\nQ:|$)', content, re.DOTALL)
    for q_idx, (q, a) in enumerate(qa_pairs):
        whitelist = {"gdp", "cpi", "m1", "m2", "as", "ad", "lr", "sr", "mpc", "mps"}
        keywords = re.findall(r'\w+', (q + " " + a).lower())
        keywords = [k for k in keywords if len(k) > 3 or k in whitelist]
        node = {
            "id": f"{idx}.{q_idx}",
            "keywords": list(set(keywords)),
            "title": cleanup_latex(q),
            "C": extract_field(a, "RULE"),
            "F": extract_field(a, "FORM"),
            "K": extract_field(a, "PROB"),
            "I": extract_field(a, "WORD"),
            "T": extract_field(a, "CALC")
        }
        if all(node[f] == "N/A" for f in "CFKIT"): node["C"] = cleanup_latex(a)
        branch["nodes"].append(node)
    final_db[str(idx)] = branch

# Tutorials
t_branch = { "branch_name": "Tutorials", "nodes": [] }
t_pairs = re.findall(r'\d+\.\s+\*\*(.*?):\*\*\s+(.*?)(?=\n\d+\.|$)', tutorial_data, re.DOTALL)
for t_idx, (q, a) in enumerate(t_pairs):
    node = {
        "id": f"T.{t_idx}",
        "keywords": list(set(re.findall(r'\w+', q.lower()))),
        "title": cleanup_latex(q),
        "C": "N/A", "F": "N/A", "K": "N/A", "I": "N/A", "T": cleanup_latex(a)
    }
    t_branch["nodes"].append(node)
final_db[str(len(section_headers))] = t_branch

# FRQs
f_branch = { "branch_name": "FRQ Guide", "nodes": [] }
frq_blocks = re.findall(r'### \d+\. (.*?)\n(.*?(?=\n###|$))', frq_data, re.DOTALL)
for f_idx, (title, content) in enumerate(frq_blocks):
    node = {
        "id": f"F.{f_idx}",
        "keywords": list(set(re.findall(r'\w+', title.lower()))),
        "title": cleanup_latex(title),
        "C": extract_field(content, "RULE"),
        "F": extract_field(content, "FORM"),
        "K": extract_field(content, "PROB"),
        "I": extract_field(content, "WORD"),
        "T": extract_field(content, "CALC")
    }
    if all(node[f] == "N/A" for f in "CFKIT"): node["I"] = cleanup_latex(content)
    f_branch["nodes"].append(node)
final_db[str(len(section_headers) + 1)] = f_branch

output_payload = {
    "system_config": {
        "appvar_max_bytes": 64000,
        "compression_dictionary": ["the", "and", "that", "this", "with", "from", "their", "they", "will", "would"]
    },
    "database": final_db
}

os.makedirs("dataset", exist_ok=True)
with open("dataset/payload.json", "w") as f:
    json.dump(output_payload, f, indent=2)

all_keywords = set()
for b in final_db.values():
    for n in b['nodes']:
        all_keywords.update(n['keywords'])

with open("src/terms_data.h", "w") as f:
    f.write("#ifndef TERMS_DATA_H\n#define TERMS_DATA_H\n\n")
    f.write(f"#define NUM_TERMS {len(all_keywords)}\n\n")
    f.write("static const char *search_terms[] = {\n")
    for kw in sorted(list(all_keywords)):
        f.write(f'    "{kw}",\n')
    f.write("};\n\n#endif\n")
