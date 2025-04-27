#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernExp(double* A, double* bias) {
    // Cache bias in shared memory for faster access
    __shared__ double shared_bias;
    if (threadIdx.x == 0) {
        shared_bias = *bias;
    }
    __syncthreads();

    int b = blockIdx.y * gridDim.x + blockIdx.x;
    int i = b * blockDim.x + threadIdx.x;
    if (i < gridDim.x * gridDim.y * blockDim.x) {  // Check boundary
        A[i] = exp(A[i] - shared_bias);
    }
}