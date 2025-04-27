#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int n, double *in, double *out)
{
    // Calculate global index in the array
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if my global index is larger than the array size
    if (globalIndex >= n) return;

    // Handle boundary conditions
    if (globalIndex < RADIUS || globalIndex >= (n - RADIUS))
    {
        out[globalIndex] = (double) globalIndex * ((double)RADIUS * 2 + 1);
        return;
    }

    double result = 0.0;

    // Use shared memory to optimize memory accesses
    extern __shared__ double shared_in[];
    int localIndex = threadIdx.x + RADIUS;
    shared_in[localIndex] = in[globalIndex];

    // Load halo elements
    if (threadIdx.x < RADIUS)
    {
        shared_in[localIndex - RADIUS] = in[globalIndex - RADIUS];
        shared_in[localIndex + blockDim.x] = in[globalIndex + blockDim.x];
    }

    __syncthreads();

    // Calculate stencil result
    for (int i = -RADIUS; i <= RADIUS; i++)
    {
        result += shared_in[localIndex + i];
    }

    out[globalIndex] = result;
}