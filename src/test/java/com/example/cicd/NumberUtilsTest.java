package com.example.cicd;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

class NumberUtilsTest {

    @Test
    void isSpecial_multipleOf3or5or7_returnsTrue() {
        assertTrue(NumberUtils.isSpecial(9));   // 3 * 3
        assertTrue(NumberUtils.isSpecial(10));  // 5 * 2
        assertTrue(NumberUtils.isSpecial(14));  // 7 * 2
    }

    @Test
    void isSpecial_13or17_returnsTrue() {
        assertTrue(NumberUtils.isSpecial(13));
        assertTrue(NumberUtils.isSpecial(17));
    }

    @Test
    void isSpecial_otherNumber_returnsFalse() {
        assertFalse(NumberUtils.isSpecial(11));
    }
}
