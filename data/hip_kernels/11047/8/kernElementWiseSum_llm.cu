#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void devVecAdd(size_t pointDim, double* dest, double* src) {
    // Optimize loop with unrolling for better performance
    for(size_t i = 0; i < pointDim; i += 4) {
        if(i < pointDim) dest[i] += src[i];
        if(i + 1 < pointDim) dest[i + 1] += src[i + 1];
        if(i + 2 < pointDim) dest[i + 2] += src[i + 2];
        if(i + 3 < pointDim) dest[i + 3] += src[i + 3];
    }
}

__global__ void kernElementWiseSum(const size_t numPoints, const size_t pointDim, double* dest, double* src) {
    // Calculate global thread ID for 1D grid and 1D block
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure i is within range
    if(i < numPoints) {
        devVecAdd(pointDim, &dest[i * pointDim], &src[i * pointDim]);
    }
}