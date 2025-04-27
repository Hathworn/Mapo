#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelUpdateNablaB(float *nabla_b, float *delta_nabla_b) {
    // Use a single variable for the index to improve readability
    int idx = threadIdx.x;
    // Perform the addition using the calculated index
    nabla_b[idx] += delta_nabla_b[idx];
}