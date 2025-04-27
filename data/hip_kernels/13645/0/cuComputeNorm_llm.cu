#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuComputeNorm(float *mat, int width, int pitch, int height, float *norm) {
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid thread work only if xIndex < width
    if (xIndex < width) {
        float sum = 0.0f;

        // Optimize loop by using strided access pattern
        for (int i = threadIdx.y; i < height; i += blockDim.y) {
            float val = mat[i * pitch + xIndex];
            sum += val * val;
        }

        // Use shared memory for intermediate results
        __shared__ float sharedSum[TILE_DIM];
        sharedSum[threadIdx.y] = sum;

        // Ensure all shared memory loads are done before reduction
        __syncthreads();

        // Perform reduction in shared memory
        if (threadIdx.y == 0) {
            float totalSum = 0.0f;
            for (int j = 0; j < blockDim.y; j++) {
                totalSum += sharedSum[j];
            }
            norm[xIndex] = totalSum;
        }
    }
}