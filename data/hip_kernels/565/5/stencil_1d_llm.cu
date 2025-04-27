#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int n, double *in, double *out)
{
    // Allocate shared memory with padding for handling halos
    extern __shared__ double temp[];

    // Calculate global and local indices
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    int localIndex = threadIdx.x + RADIUS;

    // Check boundary, exit if globalIndex is out of bounds
    if (globalIndex >= n) return;

    // Load main data into shared memory
    temp[localIndex] = in[globalIndex];

    // Load halo data into shared memory
    if (threadIdx.x < RADIUS) {
        if (globalIndex >= RADIUS) {
            temp[localIndex - RADIUS] = in[globalIndex - RADIUS];
        }
        if (globalIndex < n - RADIUS) {
            temp[localIndex + THREADS_PER_BLOCK] = in[globalIndex + THREADS_PER_BLOCK];
        }
    }

    __syncthreads();

    // Handle boundary conditions: output zero contribution for border
    if (globalIndex < RADIUS || globalIndex >= (n - RADIUS)) {
        out[globalIndex] = (double)globalIndex * ( (double)RADIUS*2 + 1);
        return;
    }

    // Compute stencil in shared memory
    double result = 0.0;
    for (int i = -RADIUS; i <= RADIUS; i++) {
        result += temp[localIndex + i];
    }

    // Store result in global memory
    out[globalIndex] = result;
}