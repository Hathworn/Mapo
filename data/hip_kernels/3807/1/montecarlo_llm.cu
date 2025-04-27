#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void montecarlo(float* d_out, float __lowx, float __highx, float __lowy, float __highy, int __iters) {
    __shared__ float lowx, highx, lowy, highy;
    __shared__ int iters;

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared variables once per block.
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

    // Use registers to store loop variables and reduce accesses to shared memory.
    int i;
    float x, y, tempSum = 0.f;
    float range_x = highx - lowx;
    float range_y = highy - lowy;

    // Each thread calculates its own summation.
    for (i = 0; i < iters; i++) {
        x = lowx + hiprand_uniform(&localState) * range_x;
        y = lowy + hiprand_uniform(&localState) * range_y;
        tempSum += expf(-x * x - y * y); // Use expf for single precision
    }
    d_out[tid] = tempSum;
}