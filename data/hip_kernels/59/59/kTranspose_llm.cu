#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTranspose(float *odata, float *idata, int width, int height) {
    __shared__ float block[COPY_BLOCK_SIZE][COPY_BLOCK_SIZE + 1];

    // Calculate indices for input and output data
    unsigned int xIndex_in = blockIdx.x * COPY_BLOCK_SIZE + threadIdx.x;
    unsigned int yIndex_in = blockIdx.y * COPY_BLOCK_SIZE + threadIdx.y;
    unsigned int xIndex_out = blockIdx.y * COPY_BLOCK_SIZE + threadIdx.x;
    unsigned int yIndex_out = blockIdx.x * COPY_BLOCK_SIZE + threadIdx.y;

    // Load data into shared memory if within bounds
    if((xIndex_in < width) && (yIndex_in < height)) {
        unsigned int index_in = yIndex_in * width + xIndex_in;
        block[threadIdx.y][threadIdx.x] = idata[index_in];
    }

    __syncthreads();

    // Write transposed data to global memory if within bounds
    if((xIndex_out < height) && (yIndex_out < width)) {
        unsigned int index_out = yIndex_out * height + xIndex_out;
        odata[index_out] = block[threadIdx.x][threadIdx.y];
    }
}