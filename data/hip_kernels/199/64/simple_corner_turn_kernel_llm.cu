#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_corner_turn_kernel(float *d_input, float *d_output, int primary_size, int secondary_size) {
    // Calculate indices using threadIdx and blockIdx
    size_t primary = blockIdx.x * blockDim.x + threadIdx.x;
    size_t secondary = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds before accessing memory
    if (primary < primary_size && secondary < secondary_size) {
        // Use __ldg for efficient memory access
        d_output[primary * secondary_size + secondary] = __ldg(&d_input[secondary * primary_size + primary]);
    }
}