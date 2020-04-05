---
title: Augmented Backus-Naur Form
---

- RFC 5234
- rule = definition ; comment CR LF
- rule names case insensitive
- terminals:
  - e.g. %d13.10 is CR LF
  - b=bin
  - d=decimal
  - x=hex
  - dot for concatenation
- text in "", ASCII
- %s"aBc" is case-sensitive
- %i"aBc" is case-insensitive
- LWSP is zero or more, newlines permitted, very controversial
- `Rule1 Rule1` concatenates
- `Rule1 / Rule2` alternatives
- `Rule1 =/ Rule2` add incremental alternative
- `%c##-##` value range
- `(Rule1 Rule2)` sequence group
- `min*maxRule` variable repetition
  - `*Rule` zero or more
  - `*1Rule` zero or one
  - `2*3Rule` two or three
- `countRule` specific repetition
- `[Rule]` optional
- `0*1(fubar snafu)`
- precedence: strings and name formation, comment, value range, repetition, grouping and optional, concatenation, alternative
- core rules:
  | `ALPHA`  | `%x41-5A / %x61-7A`                         |
  | `DIGIT`  | `%x30-39`                                   |
  | `HEXDIG` | `DIGIT / "A" / "B" / "C" / "D" / "E" / "F"` |
  | `DQUOTE` | `%x22`                                      |
  | `SP`     | `%x20`                                      |
  | `HTAB`   | `%x09`                                      |
  | `WSP`    | `SP/HTAB`                                   |
  | `LWSP`   | `*(WSP / CRLF WSP)`                         |
  | `VCHAR`  | `%x21-7E`                                   |
  | `CHAR`   | `%x01-7F`                                   |
  | `OCTET`  | `%x00-FF`                                   |
  | `CTL`    | `%x00-1F / %x7F`                            |
  | `CR`     | `%x0D`                                      |
  | `LF`     | `%x0A`                                      |
  | `CRLF`   | `CR LF`                                     |
  | `BIT`    | `"0" / "1"`                                 |
