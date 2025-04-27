#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS 256
#define BLOCKS 32
#define NUM THREADS*BLOCKS

int seed_var =1239;

__global__ void work_efficient_scan_kernel(int *X, int *Y, int InputSize)
{
    extern __shared__ int XY[];
    int i= blockIdx.x*blockDim.x + threadIdx.x;
    
    // Load elements into shared memory
    if (i < InputSize) {
        XY[threadIdx.x] = X[i];
    }
    __syncthreads();

    // Forward inclusive scan
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2) {
        int index = (threadIdx.x + 1) * 2 * stride - 1;
        if (index < blockDim.x) {
            XY[index] += XY[index - stride];
        }
        __syncthreads();
    }

    // Reverse scan to distribute additions
    for (int stride = blockDim.x / 4; stride > 0; stride /= 2) {
        int index = (threadIdx.x + 1) * stride * 2 - 1;
        if (index + stride < blockDim.x) {
            XY[index + stride] += XY[index];
        }
        __syncthreads();
    }

    // Copy result to output array
    if (i < InputSize) {
        Y[i] = XY[threadIdx.x];
    }
    __syncthreads();

    // Handle block scan additions
    if (threadIdx.x == 0 && blockIdx.x > 0) {
        Y[i] += Y[blockIdx.x * blockDim.x - 1];
    }
    __syncthreads();
}