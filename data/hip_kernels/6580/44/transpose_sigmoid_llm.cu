#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void transpose_sigmoid(float *odata, float *idata, int width, int height) {
    __shared__ float block[BLOCK_DIM][BLOCK_DIM+1];

    // Calculate matrix indices
    unsigned int xIndex = blockIdx.x * BLOCK_DIM + threadIdx.x;
    unsigned int yIndex = blockIdx.y * BLOCK_DIM + threadIdx.y;

    // Load one element per thread into shared memory
    if (xIndex < width && yIndex < height) {
        unsigned int index_in = yIndex * width + xIndex;
        block[threadIdx.y][threadIdx.x] = sigmoid(idata[index_in]); // Apply sigmoid during load
    }

    __syncthreads(); // Ensure all writes to block[][] have completed

    // Transpose write to global memory
    xIndex = blockIdx.y * BLOCK_DIM + threadIdx.x;
    yIndex = blockIdx.x * BLOCK_DIM + threadIdx.y;
    if (xIndex < height && yIndex < width) {
        unsigned int index_out = yIndex * height + xIndex;
        odata[index_out] = block[threadIdx.x][threadIdx.y]; // Transpose write
    }
}