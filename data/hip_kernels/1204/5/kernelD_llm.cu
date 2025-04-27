#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelD(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use the shared memory for atomicAdd optimization
    extern __shared__ float shared_y[];

    // Load shared memory
    for (int j = threadIdx.x; j < n / CONST; j += blockDim.x) {
        shared_y[j] = y[j];
    }
    __syncthreads();

    // Perform atomicAdd operation in shared memory
    for (int i = index; i < n; i += stride) {
        for (int j = 0; j < n / CONST; j++) {
            atomicAdd(&shared_y[j], x[j]);
        }
    }
    __syncthreads();

    // Write back to global memory
    for (int j = threadIdx.x; j < n / CONST; j += blockDim.x) {
        y[j] = shared_y[j];
    }
}