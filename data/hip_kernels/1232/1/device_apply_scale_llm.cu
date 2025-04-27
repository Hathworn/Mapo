#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_apply_scale(float* coords, float scale, size_t total_size) {
    // Calculate the global index once
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride = blockDim.x * gridDim.x;

    // Use a loop with a stride for better GPU utilization
    for (; i < total_size; i += stride) {
        coords[i] = coords[i] * scale;
    }
    // No need for __syncthreads(); as there is no shared memory race condition
}