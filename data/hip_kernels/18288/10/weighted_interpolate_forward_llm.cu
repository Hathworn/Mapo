#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void weighted_interpolate_forward(int B, int N, int M, int C, int K, const int* nnIndex, const int* nnCount, const float* input, const float* weight, float* output)
{
    int i = blockIdx.x; // Process one batch per block
    int j = threadIdx.x + blockIdx.y * blockDim.x; // Linearize thread index for parallel processing

    if (i < B && j < N * C) // Ensure within bounds
    {
        int n = j / C;
        int c = j % C;
        int nnSize = nnCount[i * N + n];
        float sum = 0.0f; // Initialize accumulation variable

        for (int k = 0; k < nnSize; k++) // Accumulate weighted sums
        {
            int m = nnIndex[i * N * K + n * K + k];
            float w = weight[i * N * K + n * K + k];
            sum += input[i * M * C + m * C + c] * w;
        }

        output[i * N * C + j] = sum; // Store accumulated result
    }
}