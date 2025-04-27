#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTranspose(float *odata, float *idata, int width, int height) {
    __shared__ float block[COPY_BLOCK_SIZE][COPY_BLOCK_SIZE+1];

    // calculate indexes for reading the matrix tile
    unsigned int xIndex = blockIdx.x * COPY_BLOCK_SIZE + threadIdx.x;
    unsigned int yIndex = blockIdx.y * COPY_BLOCK_SIZE + threadIdx.y;

    // load matrix tile into shared memory
    if((xIndex < width) && (yIndex < height)) {
        unsigned int index_in = yIndex * width + xIndex;
        block[threadIdx.y][threadIdx.x] = idata[index_in];
    }

    __syncthreads();

    // calculate indexes for writing the transposed matrix tile
    xIndex = blockIdx.y * COPY_BLOCK_SIZE + threadIdx.x;
    yIndex = blockIdx.x * COPY_BLOCK_SIZE + threadIdx.y;

    // store transposed tile into output global memory
    if((xIndex < height) && (yIndex < width)) {
        unsigned int index_out = yIndex * height + xIndex;
        odata[index_out] = block[threadIdx.x][threadIdx.y];
    }
}