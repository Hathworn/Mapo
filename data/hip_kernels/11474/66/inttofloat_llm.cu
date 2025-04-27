#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inttofloat(float *out, int *in) {
    // Load integer value from global memory to a register
    int intValue = in[0];

    // Use bitwise operations or type casting to convert to float
    float floatValue = __int_as_float(intValue);

    // Store the result back to the global memory
    out[0] = floatValue;
}