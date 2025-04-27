#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void compute_squared_norm(float * array, int width, int pitch, int height, float * norm){
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (xIndex < width) {
        float sum = 0.0f;
        int y = threadIdx.y;

        // Use shared memory for data fetched within the block
        __shared__ float sharedData[1024]; 

        // Process rows in parallel
        for (int i = y; i < height; i += blockDim.y) {
            float val = array[i * pitch + xIndex];
            sharedData[y] = val * val;
            __syncthreads();

            if (y == 0) {
                for (int j = 0; j < blockDim.y && (i+j) < height; ++j) {
                    sum += sharedData[j];
                }
            }
        }

        // Store result to global memory, single thread update to avoid race condition
        if (y == 0) {
            norm[xIndex] = sum;
        }
    }
}