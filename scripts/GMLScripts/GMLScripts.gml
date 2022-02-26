/// @func   dec_to_hex(dec [, len=1])
///
/// @desc   Returns a given value as a string of hexadecimal digits.
///         Hexadecimal strings can be padded to a minimum length.
///         Note: If the given value is negative, it will
///         be converted using its two's complement form.
///
/// @param  {real}      dec         integer
/// @param  {real}      [len=1]     minimum number of digits
///
/// @return {string}    hexadecimal digits
///
/// GMLscripts.com/license
 
function dec_to_hex(dec, len)
{
    len = is_undefined(len) ? 1 : len;
    var hex = "";
 
    if (dec < 0) {
        len = max(len, ceil(logn(16, 2*abs(dec))));
    }
 
    var dig = "0123456789ABCDEF";
    while (len-- || dec) {
        hex = string_char_at(dig, (dec & $F) + 1) + hex;
        dec = dec >> 4;
    }
 
    return hex;
}

/// @func   hex_to_dec(hex)
///
/// @desc   Returns an integer converted from an hexadecimal string.
///
/// @param  {string}    hex         hexadecimal digits
///
/// @return {real}      positive integer
///
/// GMLscripts.com/license
 
function hex_to_dec(hex)
{
    var dec = 0;
 
    var dig = "0123456789ABCDEF";
    var len = string_length(hex);
    for (var pos=1; pos<=len; pos+=1) {
        dec = dec << 4 | (string_pos(string_char_at(hex, pos), dig) - 1);
    }
 
    return dec;
}