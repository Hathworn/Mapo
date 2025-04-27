#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UpdateSecond(float *WHAT, float *WITH, float AMOUNT, float *MULT)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check if idx is within bounds (assuming size is known or passed as an additional parameter)
    if (idx < /* size */) {
        // Combine multiplications into single operation to save memory access time
        float mult_val = MULT[idx];
        WHAT[idx] = WHAT[idx] * mult_val + AMOUNT * WITH[idx];
        MULT[idx] = 1.0f;
    }
}