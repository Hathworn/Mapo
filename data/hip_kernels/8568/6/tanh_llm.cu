#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tanh(float *inout, float *bias, int rows, int cols) {
    // Use shared memory to minimize global memory access
    extern __shared__ float shared_bias[];
    
    // Load bias into shared memory
    int tid = threadIdx.y * blockDim.x + threadIdx.x;
    if (tid < rows) {
        shared_bias[tid] = bias[tid];
    }
    __syncthreads();

    // Optimize index calculation
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (j < cols && i < rows) {
        inout[i * cols + j] = tanhf(inout[i * cols + j]) + shared_bias[i];
    }
}