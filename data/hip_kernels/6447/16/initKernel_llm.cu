#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initKernel(double* data, int count, double val) {
    // Use block-level shared memory for better bandwidth utilization (if applicable)
    int ti = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop if possible
    #pragma unroll
    for (int idx = ti; idx < count; idx += blockDim.x * gridDim.x) {
        data[idx] = val;
    }
}