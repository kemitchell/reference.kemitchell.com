---
title: Augmented Backus-Naur Form
---

- [RFC 5234](https://tools.ietf.org/html/rfc5234)
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

  <table>
  <tr><td><code>ALPHA</code></td><td><code>%x41-5A / %x61-7A</code></td></tr>
  <tr><td><code>DIGIT</code></td><td><code>%x30-39</code></td></tr>
  <tr><td><code>HEXDIG</code></td><td><code>DIGIT / "A" / "B" / "C" / "D" / "E" / "F"</code></td></tr>
  <tr><td><code>DQUOTE</code></td><td><code>%x22</code></td></tr>
  <tr><td><code>SP</code></td><td><code>%x20</code></td></tr>
  <tr><td><code>HTAB</code></td><td><code>%x09</code></td></tr>
  <tr><td><code>WSP</code></td><td><code>SP / HTAB</code></td></tr>
  <tr><td><code>LWSP</code></td><td><code>*(WSP / CRLF WSP)</code></td></tr>
  <tr><td><code>VCHAR</code></td><td><code>%x21-7E</code></td></tr>
  <tr><td><code>CHAR</code></td><td><code>%x01-7F</code></td></tr>
  <tr><td><code>OCTET</code></td><td><code>%x00-FF</code></td></tr>
  <tr><td><code>CTL</code></td><td><code>%x00-1F / %x7F</code></td></tr>
  <tr><td><code>CR</code></td><td><code>%x0D</code></td></tr>
  <tr><td><code>LF</code></td><td><code>%x0A</code></td></tr>
  <tr><td><code>CRLF</code></td><td><code>CR LF</code></td></tr>
  <tr><td><code>BIT</code></td><td><code>"0" / "1"</code></td></tr>
  </table>
