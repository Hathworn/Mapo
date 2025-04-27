#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_interpolate_backward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* gradOutput, const float* weight, float* gradInput)
{
    int i = blockIdx.x; // Each block processes one batch
    int n = threadIdx.x / C; // Determine n by thread index
    int c = threadIdx.x % C; // Compute c from thread index
    
    if (i < B && n < N) // Ensure within bounds
    {
        float gradOutVal = gradOutput[i * N * C + n * C + c]; // Precompute gradOutput
        int nnSize = nnCount[i * N + n];
        for (int k = 0; k < nnSize; k++)
        {
            int m = nnIndex[i * N * K + n * K + k];
            float w = weight[i * N * K + n * K + k];
            atomicAdd(&gradInput[i * M * C + m * C + c], gradOutVal * w); // Use precomputed gradOutput
        }
    }
}