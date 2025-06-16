
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load your data
df = pd.read_csv("Top_analyst_pay_jobs_requirements.csv")

# Count frequency of each skill
skill_counts = df['skills'].value_counts()

# Select top 10 skills
top_10_skills = skill_counts.head(10)
cumulative_percentage_top10 = top_10_skills.cumsum() / skill_counts.sum() * 100

# Plot setup
plt.figure(figsize=(10, 6))
sns.set(style="whitegrid")

# Bar chart for frequencies
barplot = sns.barplot(x=top_10_skills.index, y=top_10_skills.values, color='#4A90E2', label='Frequency')

# Line chart for cumulative percentage
ax2 = barplot.twinx()
sns.lineplot(x=top_10_skills.index, y=cumulative_percentage_top10, color='#D0021B', marker='o', linewidth=2, ax=ax2, label='Cumulative %')

# Annotate each bar
for i, val in enumerate(top_10_skills.values):
    barplot.text(i, val + 1, f'{val}', ha='center', va='bottom', fontsize=9)

# Axis and titles
barplot.set_ylabel("Frequency", fontsize=12)
ax2.set_ylabel("Cumulative Percentage (%)", fontsize=12)
barplot.set_title("Top 10 Skills in High Paying Analyst Jobs (Pareto Analysis)", fontsize=14, fontweight='bold')
barplot.set_xticklabels(barplot.get_xticklabels(), rotation=45, ha='right')
ax2.set_ylim(0, 100)
ax2.axhline(80, color='gray', linestyle='--', linewidth=1)
barplot.legend(loc='upper left')
ax2.legend(loc='upper right')

plt.tight_layout()
plt.show()