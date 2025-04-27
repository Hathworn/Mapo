```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log(float* in, float* out, int size) {
    // Compute unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride loop to cover all elements
    int stride = blockDim.x * gridDim.x; 
    for (int i = tid; i < size; i += stride) {
        out[i] = log(in[i]); // Apply log operation
    }
}