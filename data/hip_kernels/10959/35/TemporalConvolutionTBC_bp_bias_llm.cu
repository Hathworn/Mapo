#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TemporalConvolutionTBC_bp_bias(float* matrix, float* target, int rows, int stride, float scale) {
    // Use shared memory for partial sums
    __shared__ float sharedData[32];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x; // More flexible for varying block sizes
    float t = 0;

    // Each block processes multiple rows and accumulates results
    for (int j = blockIdx.y; j < rows; j += gridDim.y) {
        t += matrix[j * stride + i];
    }

    // Store the partial sum to shared memory
    sharedData[threadIdx.x] = t;

    // Synchronize threads within the block
    __syncthreads();

    // Sum the partial results in shared memory
    if (threadIdx.x == 0) {
        float blockSum = 0;
        for (int k = 0; k < blockDim.x; ++k) {
            blockSum += sharedData[k];
        }
        // Use atomic add to accumulate the final results from each block
        atomicAdd(&target[blockIdx.x * blockDim.x], blockSum * scale);
    }
}