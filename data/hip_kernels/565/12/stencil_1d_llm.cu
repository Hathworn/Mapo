#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stencil_1d(int n, double *in, double *out)
{
    // Calculate global index in the array
    int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if my global index is larger than the array size
    if (globalIndex >= n) return;

    // Handle the boundary conditions
    if (globalIndex < RADIUS || globalIndex >= (n - RADIUS)) {
        out[globalIndex] = (double)globalIndex * ((double)RADIUS * 2 + 1);
        return;
    }

    double result = 0.0;

    // Unroll loop for better performance
    #pragma unroll
    for (int i = globalIndex - RADIUS; i <= globalIndex + RADIUS; i++) {
        result += in[i];
    }

    out[globalIndex] = result;
}