```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void montecarlo(float* d_out, float __lowx, float __highx, float __lowy, float __highy, int __iters) {
    __shared__ float lowx, highx, lowy, highy;
    __shared__ int iters;

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared variables only once per block
    if (threadIdx.x == 0) {
        lowx = __lowx;
        highx = __highx;
        lowy = __lowy;
        highy = __highy;
        iters = __iters;
    }
    __syncthreads();

    hiprandState localState;
    hiprand_init(tid, 0, 0, &localState);

    float x, y, tempSum = 0.0f;

    // Use strided loop to reduce thread divergence and improve memory access
    for (int i = tid; i < iters * gridDim.x * blockDim.x; i += gridDim.x * blockDim.x) {
        x = lowx + hiprand_uniform(&localState) * (highx - lowx);
        y = lowy + hiprand_uniform(&localState) * (highy - lowy);
        tempSum += expf(-x * x - y * y);
    }

    d_out[tid] = tempSum;
}