#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernElementWiseMax(const size_t numPoints, double* dest, double* src) {
    // Calculate flattened global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and perform max operation
    if (i < numPoints) {
        dest[i] = max(dest[i], src[i]);
    }
}