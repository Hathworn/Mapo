#include "hip/hip_runtime.h"
#include "includes.h"

// Unroll loop to improve performance; use __restrict__ qualifiers to help optimizer
__global__ void loadOP() {
    // Assuming input and output are declared and accessible
    // Use registers to store intermediate results
    const float * __restrict__ input;
    float * __restrict__ output;
    
    #pragma unroll
    for (int i = 0; i < 9; ++i) {
        output[i] = Load<DF + i>(input + i);
    }
}