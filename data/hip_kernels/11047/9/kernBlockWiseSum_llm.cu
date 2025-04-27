#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernBlockWiseSum(const size_t numPoints, const size_t pointDim, double* dest) {
    // Assumes a 2D grid of 1024x1 1D blocks
    int b = blockIdx.y * gridDim.x + blockIdx.x;
    int i = b * blockDim.x + threadIdx.x;

    // Declare shared memory block
    extern __shared__ double blockSum[];

    // Load data into shared memory or set to 0 if out of bounds
    blockSum[threadIdx.x] = (i >= numPoints) ? 0.0 : dest[i * pointDim];
    __syncthreads();

    // Reduce within the block
    for (int s = 1; s < blockDim.x; s *= 2) {
        int index = 2 * s * threadIdx.x;
        if (index < blockDim.x) {
            blockSum[index] += blockSum[index + s];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        dest[b * pointDim] = blockSum[0];
    }
}