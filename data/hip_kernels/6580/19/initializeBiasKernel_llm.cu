#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initializeBiasKernel(float* b, int size) {
    // Use shared memory for faster memory access
    extern __shared__ float sharedBias[];

    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < size) {
        sharedBias[threadIdx.x] = 0.0;
        __syncthreads();
        b[index] = sharedBias[threadIdx.x];
    }
}