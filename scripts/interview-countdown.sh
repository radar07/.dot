# Target date: 6 months from today (adjust this to your actual target date)
# Format: YYYY-MM-DD
TARGET_DATE="2026-04-30"

# Get current date
CURRENT_DATE=$(date +%Y-%m-%d)

# Calculate days remaining
DAYS_REMAINING=$(( ($(date -d "$TARGET_DATE" +%s) - $(date -d "$CURRENT_DATE" +%s)) / 86400 ))

# Different icons and messages based on time remaining
if [ "$DAYS_REMAINING" -lt 0 ]; then
    echo "🎯 Interview Time!"
elif [ "$DAYS_REMAINING" -eq 0 ]; then
    echo "🚀 Today!"
elif [ "$DAYS_REMAINING" -le 7 ]; then
    echo "⚡ ${DAYS_REMAINING}d left"
elif [ "$DAYS_REMAINING" -le 30 ]; then
    echo "🔥 ${DAYS_REMAINING}d left"
elif [ "$DAYS_REMAINING" -le 60 ]; then
    echo "⏰ ${DAYS_REMAINING}d left"
else
    echo "📚 ${DAYS_REMAINING}d left"
fi
