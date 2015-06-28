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

  uint32_t fractionalMask = 0;
  uint32_t integerMask = 0;
  for(unsigned u = 0; u < fracBits; u++) {
    fractionalMask += (1 << u);
  }
  for(unsigned u = fracBits; u < 32; u++) {
    integerMask += (1 << u);
  }

  //compute the fractional part
  double scaledDouble = value * (1 << fracBits); //Shift the double to expose the fractional part


  int32_t scaledFracVal = ((int32_t)scaledDouble) << intBits; //Ignore any further fractional part and strip of the integer part
  uint32_t normalizedFracVal = (scaledFracVal >> intBits)& fractionalMask;

  //compute the integer part
  long uintVal = (long)value;
  if(value < 0 && normalizedFracVal != 0) { uintVal--;} //correct the negative cases
  uint32_t scaledUintVal = (uintVal << fracBits) & integerMask;

  uint32_t result = scaledUintVal | normalizedFracVal;

  // printf("%lf\n", value);
  // printf("fractional \t scaleddouble: %lf \n fracval: %08x \n normalizedFracVal %08x\n", scaledDouble, scaledFracVal, normalizedFracVal);
  // printf("integer \t uintval: %u \n scaledUintVal: %08x\n", uintVal, scaledUintVal);
  // printf("%lf \t %08x\n\n\n", value, result);

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
