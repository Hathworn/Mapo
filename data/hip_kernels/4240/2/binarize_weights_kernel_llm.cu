#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef CUDNN
#pragma comment(lib, "cudnn.lib")
#endif

extern "C" {
}

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (f >= n) return;

    // Allocate shared memory for partial sums
    __shared__ float partial_sum[1024]; // Adjust size according to blockDim.x if needed
    partial_sum[threadIdx.x] = 0.0f;

    int i = threadIdx.x;
    while (i < size) {
        partial_sum[threadIdx.x] += fabs(weights[f*size + i]);
        i += blockDim.x;
    }
    __syncthreads();

    // Reduce sum in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            partial_sum[threadIdx.x] += partial_sum[threadIdx.x + s];
        }
        __syncthreads();
    }

    float mean = partial_sum[0] / size; // Only the first thread has the correct mean

    // Reuse mean computation for binarization
    i = threadIdx.x;
    while (i < size) {
        binary[f*size + i] = (weights[f*size + i] > 0) ? mean : -mean;
        i += blockDim.x;
    }
}