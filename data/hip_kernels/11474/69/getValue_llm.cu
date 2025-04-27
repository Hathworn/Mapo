#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void getValue(float *outdata, float *indata) {
    // Use aliasing for better readability
    float input = indata[0];
    
    // Perform computation
    float result = input + 3.0f;
    
    // Store result
    outdata[0] = result;
}