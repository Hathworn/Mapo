#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matByConst(unsigned char *img, unsigned char *result, int alpha, int cols, int rows) {
    // Use shared memory to cache image data for efficiency
    __shared__ unsigned char tile[32][32]; 

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < rows && col < cols) {
        // Load data into shared memory
        tile[threadIdx.y][threadIdx.x] = img[row * cols + col];

        // Synchronize all threads in block to ensure all data is loaded
        __syncthreads();
        
        // Perform the computation using shared memory
        result[row * cols + col] = tile[threadIdx.y][threadIdx.x] * alpha;
    }
}