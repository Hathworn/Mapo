```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanh_grad(float *pre_grad, float *output, int rows, int cols) {
    // Compute global thread index for 1D array access
    int index = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;

    // Linearize the 2D grid and block structure to a single index
    int total_threads = gridDim.x * blockDim.x * gridDim.y * blockDim.y;
    
    // Loop unrolling in case of insufficient threads, to cover all elements
    for(int idx = index; idx < rows * cols; idx += total_threads) {
        float t = output[idx];
        pre_grad[idx] *= 1 - t * t;
    }
}