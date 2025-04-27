```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Update(float *WHAT, float *WITH, float AMOUNT) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index

    // Ensure we do not access memory out of bounds
    if (idx < your_condition) {
        WHAT[idx] += AMOUNT * WITH[idx]; // Perform update with bounds check
    }
}