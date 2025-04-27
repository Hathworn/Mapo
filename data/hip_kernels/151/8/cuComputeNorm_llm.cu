#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuComputeNorm(float *mat, int width, int pitch, int height, float *norm) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if xIndex is within bounds
    if (xIndex < width) {
        float sum = 0.0f;

        // Use shared memory for improved data locality
        extern __shared__ float shared[];

        // Load matrix values into shared memory in chunks
        for (int i = threadIdx.y; i < height; i += blockDim.y) {
            shared[threadIdx.y] = mat[i * pitch + xIndex];
            __syncthreads();
            sum += shared[threadIdx.y] * shared[threadIdx.y];
            __syncthreads();
        }

        // Write the sum to norm array
        norm[xIndex] = sum;
    }
}