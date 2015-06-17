#include "fixedpointconverter.h"

#include <stdint.h>
#include <cmath>
#include <cstdio>

FixedPointConverter::FixedPointConverter(unsigned _intBits, unsigned _fracBits) :
  intBits(_intBits),
  fracBits(_fracBits) {

  if(intBits + fracBits != 32) {
    printf("Convertor only suitable for a total length of 32 bit\n");
    printf("Defaulting to 8 bit signed integer with 24 fractional bits\n");
    intBits = 8;
    fracBits = 24;
  }

  bound = pow(2,(intBits - 1));
}

uint32_t FixedPointConverter::to_FP(double value) {

  if(value >= bound || value < -bound) {

    printf("invalid number: %lf\n",value);
    return 1;
  }

  //compute the fractional part
  double scaledDouble = value * (double)(1 << (fracBits)); //Shift the double to expose the fractional part
  uint32_t scaledFracVal = ((uint32_t)scaledDouble) << intBits; //Ignore any further fractional part and strip of the integer part
  uint32_t normalizedFracVal = scaledFracVal >> intBits;

  //compute the integer part
  long uintVal = (long)value;

  if(value < 0 && scaledFracVal != 0) uintVal--; //fix the off by one error due to signedness of integers in an unsigned format
  uint32_t scaledUintVal = uintVal << fracBits;

  uint32_t result = scaledUintVal | normalizedFracVal;

  // printf("%lf\n", value);
  // printf("uintval: %u \t\t\t scaledUintVal: %08x\n", uintVal, scaledUintVal);
  // printf("scaleddouble: %lf \t fracval: %08x \t normalizedFracVal %08x\n", scaledDouble, scaledFracVal, normalizedFracVal);
  // printf("%lf \t %08x\n", value, result);

  return result;
}

double FixedPointConverter::from_FP(uint32_t value) {
  uint32_t integerPart = value >> fracBits;
  uint32_t fractionalPart = (value << intBits) >> intBits;

  double d_int = static_cast<double>(integerPart);
  double d_frac = static_cast<double>(fractionalPart);

  if(d_int > bound) {
    d_int = d_int - 2*bound;
  }

  double result = d_int + d_frac * pow(2,-(double)fracBits);

  // printf("value: %08x \t integerpart: %08x \t fractionalPart: %08x\n", value, integerPart, fractionalPart);
  // printf("integerpart: %lf \t fractionalPart: %lf\n", d_int, d_frac);

  return result;
}
