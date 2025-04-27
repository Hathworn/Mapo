#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int *in, int *out)
{
    // Calculate the global index only once outside the loop
    int gindex = threadIdx.x + blockIdx.x * blockDim.x + RADIUS;

    int result = 0;

    // Use shared memory to reduce global memory access
    extern __shared__ int sharedMem[];

    // Load data into shared memory with offset
    sharedMem[threadIdx.x + RADIUS] = in[gindex];
    if (threadIdx.x < RADIUS) {
        sharedMem[threadIdx.x] = in[gindex - RADIUS];
        sharedMem[threadIdx.x + blockDim.x + RADIUS] = in[gindex + blockDim.x];
    }
    __syncthreads(); // Ensure all threads have loaded their data

    for (int offset = -RADIUS; offset <= RADIUS; offset++)
        result += sharedMem[threadIdx.x + RADIUS + offset]; // Access shared memory

    // Store the result
    out[gindex - RADIUS] = result;
}