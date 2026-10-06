from collections import Counter

# step 1 freq
text = "CSY LEZI GSQI XLMW JEV. XVYWX CSYVWIPJ, FIPMIZI MR LSA JEV CSY GER KS, ERH RIZIV WXST QSZMRK JSVAEVH."

letters = []
for c in text:
    if c.isalpha():
        capital = c.upper()
        letters.append(capital)
    
counts = Counter(letters)

# calc freq for all letters
print(counts)
# Counter({'S': 9, 'I': 8, 'V': 7, 'E': 6, 'R': 5, 'Y': 4, 'Z': 4, 'X': 4, 'M': 4, 'W': 4, 'J': 4, 'C': 3, 'L': 3, 'G': 2, 'Q': 2, 'P': 2, 'A': 2, 'K': 2, 'H': 2, 'F': 1, 'T': 1})

# print the 5 most common letters
print(counts.most_common(5))
# output: [('S', 9), ('I', 8), ('V', 7), ('E', 6), ('R', 5)]


# =========================

#  S  = [E, T]
# E represent index = 4
# the can add or subtract 4 to get the original letter
# order('S') = 18
# O P Q R ``S`` T U V W
# order('O') = 14
# order('W') = 22

# backward by 4 pos
def decrypt_caesar(text, shift):
    decoded = []
    for char in text:
        if char.isalpha():
            base = ord('A') if char.isupper() else ord('a')
            decoded.append(chr((ord(char) - base - shift) % 26 + base))
        else:
            decoded.append(char)
    return "".join(decoded)

print(decrypt_caesar(text, 4))
# YOU HAVE COME THIS FAR. TRUST YOURSELF, BELIEVE IN HOW FAR YOU CAN GO, AND NEVER STOP MOVING FORWARD.