#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void getValue(float *outdata, float *indata) {
    // Use ternary operator outside of array access for better readability
    outdata[0] = (indata[0] == 0.0f) ? 3.0f : 2.0f; // Correct the indata check
}