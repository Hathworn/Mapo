#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void relu_grad(float *pre_grad, float *output, int rows, int cols) {
    // Optimize memory access with shared memory
    extern __shared__ float shared_output[];
    
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int index = i * cols + j;

    // Load output into shared memory
    if (j < cols && i < rows) {
        shared_output[threadIdx.y * blockDim.x + threadIdx.x] = output[index];
    }
    __syncthreads();

    // Check and set pre_grad only if within bounds and output is non-positive
    if (j < cols && i < rows && shared_output[threadIdx.y * blockDim.x + threadIdx.x] <= 0) {
        pre_grad[index] = 0;
    }
}