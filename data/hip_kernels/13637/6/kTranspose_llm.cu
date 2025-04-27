#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTranspose(float *odata, float *idata, int width, int height) {
    __shared__ float block[COPY_BLOCK_SIZE][COPY_BLOCK_SIZE+1];

    // Calculate indices outside the boundary check to prevent redundant calculations
    unsigned int xIndex_in = blockIdx.x * COPY_BLOCK_SIZE + threadIdx.x;
    unsigned int yIndex_in = blockIdx.y * COPY_BLOCK_SIZE + threadIdx.y;
    unsigned int index_in = yIndex_in * width + xIndex_in;

    unsigned int xIndex_out = blockIdx.y * COPY_BLOCK_SIZE + threadIdx.x;
    unsigned int yIndex_out = blockIdx.x * COPY_BLOCK_SIZE + threadIdx.y;
    unsigned int index_out = yIndex_out * height + xIndex_out;

    // Read the matrix tile into shared memory, only if indices are within bounds
    if (xIndex_in < width && yIndex_in < height) {
        block[threadIdx.y][threadIdx.x] = idata[index_in];
    }

    __syncthreads();

    // Write the transposed matrix tile to global memory, only if indices are within bounds
    if (xIndex_out < height && yIndex_out < width) {
        odata[index_out] = block[threadIdx.x][threadIdx.y];
    }
}