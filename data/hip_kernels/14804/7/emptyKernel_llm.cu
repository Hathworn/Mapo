#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel with potential workload allocation
__global__ void optimizedKernel(int *data, int num_elements) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads that are out of bounds
    if (idx >= num_elements) return;

    // Process data if within bounds (Example workload)
    data[idx] = idx * 2;
}