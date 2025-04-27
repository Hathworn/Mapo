#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan(float *input, float *output, float *aux, int len) {

    // Declare shared memory
    __shared__ float XY[2 * BLOCK_SIZE];

    // Calculate global and local thread index
    int bx = blockIdx.x;
    int tx = threadIdx.x;
    int i = 2 * bx * blockDim.x + tx;

    // Load data into shared memory with bounds checking
    XY[tx] = (i < len) ? input[i] : 0.0f;
    XY[tx + blockDim.x] = (i + blockDim.x < len) ? input[i + blockDim.x] : 0.0f;

    // Ensure all threads have loaded their data
    __syncthreads();

    // Up-sweep phase
    for (unsigned int stride = 1; stride <= BLOCK_SIZE; stride *= 2) {
        __syncthreads();
        int index = (tx + 1) * stride * 2 - 1;
        if (index < 2 * BLOCK_SIZE)
            XY[index] += XY[index - stride];
    }

    // Down-sweep phase
    for (int stride = BLOCK_SIZE / 2; stride > 0; stride /= 2) {
        __syncthreads();
        int index = (tx + 1) * stride * 2 - 1;
        if (index + stride < 2 * BLOCK_SIZE)
            XY[index + stride] += XY[index];
    }

    // Synchronize before writing data back to global memory
    __syncthreads();

    // Write data back to global memory with bounds checking
    if (i < len)
        output[i] = XY[tx];
    if (i + blockDim.x < len)
        output[i + blockDim.x] = XY[tx + blockDim.x];

    // Store block sum to aux array
    if (aux != NULL && tx == 0)
        aux[bx] = XY[2 * blockDim.x - 1];
}