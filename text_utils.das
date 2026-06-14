require daslib/utf8_utils
require strings


module text_utils public


def public typewriter_text_length(text : string) : int {
    return utf8_length(text)
}


def public typewriter_text_slice(text : string; charCount : int) : string {
    if (charCount <= 0) {
        return ""
    }
    let codepoints <- utf8_decode(text)
    let total = length(codepoints)
    if (charCount >= total) {
        return text
    }
    var truncated : array<uint>
    resize(truncated, charCount)
    for (i in range(charCount)) {
        truncated[i] = codepoints[i]
    }
    return string(utf8_encode(truncated))
}
