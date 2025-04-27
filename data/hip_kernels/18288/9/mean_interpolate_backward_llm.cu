#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_interpolate_backward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* gradOutput, float* gradInput)
{
    // Calculate global thread Id
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within bounds
    if (i < B && j < N * C)
    {
        int n = j / C;
        int c = j % C;
        int nnSize = nnCount[i * N + n];
        
        // Loop through neighbors
        for(int k = 0; k < nnSize; k++)
        {
            int m = nnIndex[i * N * K + n * K + k];
            // Atomic addition to avoid race conditions
            atomicAdd(&gradInput[i * M * C + m * C + c], gradOutput[i * N * C + j] / nnSize);
        }
    }
}