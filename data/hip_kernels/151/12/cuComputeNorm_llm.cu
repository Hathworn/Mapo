#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuComputeNorm(float *mat, int width, int pitch, int height, float *norm){
    // Cache block index and thread index
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (xIndex < width){
        float sum = 0;
        // Use shared memory for faster access
        __shared__ float shared_val[1024]; // Edit size according to block size

        // Load values into shared memory
        for (int i = threadIdx.y; i < height; i += blockDim.y) {
            shared_val[threadIdx.y] = mat[i * pitch + xIndex];
        }
        __syncthreads();

        // Compute sum of squares
        for (int i = threadIdx.y; i < height; i += blockDim.y) {
            float val = shared_val[threadIdx.y];
            sum += val * val;
        }

        // Store result
        if (threadIdx.y == 0) {
            norm[xIndex] = sum;
        }
    }
}