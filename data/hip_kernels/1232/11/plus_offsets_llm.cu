#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void plus_offsets(float *coords, float *random, size_t total_size, float alpha) {
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < total_size) {
        // Combined calculations in a single line for clarity and efficiency
        coords[index] += random[index] * alpha;
    }
    // Removed __syncthreads() as it is unnecessary here, for performance
}