#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void device_apply_scale(float* __restrict__ coords, float scale, size_t total_size) {
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < total_size) {
        coords[i] *= scale; // Simplified in-place multiplication
    }
}