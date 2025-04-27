#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_update_models(float4* d_positions, float4* d_modelBuffer, int numel) {
    // Calculate row index using block dimensions for better readability
    size_t idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Early exit if index exceeds number of elements
    if (idx >= numel) return;

    // Directly store the required values in the model buffer
    d_modelBuffer[idx * 4 + 3] = make_float4(
        d_positions[idx].x,
        d_positions[idx].y,
        d_positions[idx].z,
        1.0f  // Use explicit float literal for consistency
    );

    // Remove __syncthreads() as it is not necessary
}