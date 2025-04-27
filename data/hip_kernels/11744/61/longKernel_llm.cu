#include "hip/hip_runtime.h"
#include "includes.h"

// Use CUDA parallelization to optimize the loop inside the kernel
__global__ void longKernel(float *data, int N, float value) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < N) {
        data[i] += value;  // Perform the addition in parallel
    }
}