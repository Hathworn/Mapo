#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_corner_turn_kernel(float *d_input, float *d_output, int primary_size, int secondary_size){
    // Calculate flattened global thread id for optimization
    int idx = blockIdx.y * blockDim.y * primary_size + blockIdx.x * blockDim.x + threadIdx.y * primary_size + threadIdx.x;

    // Check grid boundaries to ensure valid memory access
    if (blockIdx.x * blockDim.x + threadIdx.x < primary_size && blockIdx.y * blockDim.y + threadIdx.y < secondary_size) {
        d_output[blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * primary_size] = 
            __ldg(&d_input[idx]);
    }
}