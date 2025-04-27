#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use a single loop with thread-safe atomicAdd
    for (int i = tid; i < size; i += stride) {
        atomicAdd(&in_d[i], out_d[i] * 2 * in_x[i]);
    }
}