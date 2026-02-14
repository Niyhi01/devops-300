# 1. Define an array of questions, each with a prompt, correct answer, and explanation.
# 2. Initialize score and total_questions variables.
# 3. Loop through the array of questions.
# 4. For each: Display prompt, read user input.
# 5. Compare input to answer (case-insensitive).
# 6. If match: Increment score, print "Correct!".
# 7. If fail: Display correct answer and the "Why" explanation.
# 8. Print final score and a "rank" based on performance.


#!/bin/bash

# Configuration: "Question|Answer|Explanation"
questions=(
    "Mask for /25 in dotted decimal?|255.255.255.128|/25 uses 1 bit in the 4th octet (128)."
    "Usable hosts in a /27?|30|2^5 = 32 total, minus 2 (network & broadcast) = 30."
    "CIDR for 255.255.255.240?|/28|240 is 11110000 (4 bits). 24 + 4 = 28."
    "Network ID for 192.168.1.50/26?|192.168.1.0|/26 increments by 64. 50 fits in 0-63 range."
    "Broadcast for 10.0.0.0/12?|10.15.255.255|/12 mask is 255.240.0.0. Block size is 16 in 2nd octet."
)

score=0
total=${#questions[@]}

echo "--- Subnetting Practice Drill v1 ---"
echo "Format: Type answers exactly (e.g., 255.255.255.0 or /24)"

for q in "${questions[@]}"; do
    IFS="|" read -r prompt answer explanation <<< "$q"
    echo -e "\n[?] $prompt"
    read -p ">> " user_ans

    if [[ "${user_ans,,}" == "${answer,,}" ]]; then
        echo "✅ Correct!"
        ((score++))
    else
        echo "❌ Wrong. Correct: $answer"
        echo "💡 Explanation: $explanation"
    fi
done

echo -e "\n--- Final Score: $score/$total ---"
[[ $score -eq $total ]] && echo "Master status: Networking Ninja!" || echo "Keep drilling!"
