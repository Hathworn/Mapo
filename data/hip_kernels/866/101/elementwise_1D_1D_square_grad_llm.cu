#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    // Calculate thread id
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride loop for efficient memory access
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        in_d[i] += out_d[i] * 2 * in_x[i];  // Element-wise square gradient computation
    }
}