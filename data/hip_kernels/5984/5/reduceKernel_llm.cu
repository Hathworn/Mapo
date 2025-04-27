#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void reduceKernel(float *d_Result, float *d_Input, int N) {
    extern __shared__ float sdata[]; // Use shared memory for reduction
    const int tid = threadIdx.x;
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    float sum = 0;

    for (int i = index; i < N; i += blockDim.x * gridDim.x)
        sum += d_Input[i];

    sdata[tid] = sum;
    __syncthreads();

    // Perform in-shared memory reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tid == 0) {
        d_Result[blockIdx.x] = sdata[0];
    }
}