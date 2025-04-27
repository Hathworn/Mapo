#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void avg_pool3d_backward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* gradOutput, float* gradInput)
{
    int i = blockIdx.x;
    int j = threadIdx.x;
    
    // Ensure valid block and thread indexes
    if (i < B && j < M * C) {
        int m = j / C;
        int c = j % C;
        int nnSize = nnCount[i * M + m];
        
        // Check for non-zero neighbors
        if (nnSize > 0) {
            float scale = gradOutput[i * M * C + j] / nnSize;
            
            for (int k = 0; k < nnSize; k++) {
                int n = nnIndex[i * M * K + m * K + k]; // only neighbor, no bin indices, dimension=(B,M,K)
                atomicAdd(&gradInput[i * N * C + n * C + c], scale);
            }
        }
    }
}