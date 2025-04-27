#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencil_1d(int n, double *in, double *out)
{
    // Allocate shared memory with extra space for halos
    __shared__ double temp[THREADS_PER_BLOCK + 2 * (RADIUS)];

    // Calculate global and local indices
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int localIndex = threadIdx.x + RADIUS;

    // Return if global index exceeds array size
    if (globalIndex >= n) return;

    // Load input elements into shared memory
    temp[localIndex] = in[globalIndex];

    // Load halo elements when within valid bounds
    if (threadIdx.x < RADIUS) {
        if (globalIndex >= RADIUS)
            temp[localIndex - RADIUS] = in[globalIndex - RADIUS];
        if (globalIndex + THREADS_PER_BLOCK < n)
            temp[localIndex + THREADS_PER_BLOCK] = in[globalIndex + THREADS_PER_BLOCK];
    }
    __syncthreads();

    // Handle boundary conditions
    if (globalIndex < RADIUS || globalIndex >= (n - RADIUS)) {
        out[globalIndex] = (double)globalIndex * ((double)RADIUS * 2 + 1);
        return;
    }

    // Calculate result using a stencil operation
    double result = 0.0;
    #pragma unroll  // Unroll stencil loop for performance
    for (int i = -RADIUS; i <= RADIUS; i++) {
        result += temp[localIndex + i];
    }

    out[globalIndex] = result;
}