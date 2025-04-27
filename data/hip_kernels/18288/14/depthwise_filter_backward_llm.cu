#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void depthwise_filter_backward(int B, int N, int M, int F, int C, int r, int K, const int* nnIndex, const int* nnCount, const int* binIndex, const float* input, const float* gradOutput, float* gradFilter, int sharedMemSize, int startIdx)
{
    extern __shared__ float gradPerBlock[]; 
    // Initialize shared memory
    for (int i = threadIdx.x; i < sharedMemSize; i += blockDim.x) {
        gradPerBlock[i] = 0;
    }
    __syncthreads();
    
    // Calculate start indices
    int endIdx = sharedMemSize + startIdx;
    int globalThreadIdx = blockIdx.y * blockDim.x + threadIdx.x;
    
    // Loop through batches
    for (int i = blockIdx.x; i < B; i += gridDim.x) {
        // Iterate over elements with stride to cover all
        for (int j = globalThreadIdx; j < M * (C * r); j += blockDim.x * gridDim.y) {
            int cout = j % (C * r);
            int cin = cout / r;
            int m = j / (C * r);
            int nnSize = nnCount[i * M + m];
            
            // Loop through neighbors
            for (int k = 0; k < nnSize; k++) {
                int n = nnIndex[i * M * K + m * K + k];
                int f = binIndex[i * M * K + m * K + k];
                
                // Calculate gradient
                float derFilt = gradOutput[i * M * C * r + j] * input[i * N * C + n * C + cin] / nnSize;
                int currIdx = f * C * r + cout;
                
                // Use atomic operations for safe accumulation
                if ((currIdx >= startIdx) && (currIdx < endIdx)) {
                    atomicAdd(&gradPerBlock[currIdx - startIdx], derFilt);
                }
            }
        }
    }
    __syncthreads();
    
    // Accumulate results into global memory
    for (int i = threadIdx.x; i < sharedMemSize; i += blockDim.x) {
        atomicAdd(&gradFilter[i + startIdx], gradPerBlock[i]);
    }
}