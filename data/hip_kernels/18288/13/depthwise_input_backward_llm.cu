#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void depthwise_input_backward(int B, int N, int M, int F, int C, int r, int K, 
                                         const int* nnIndex, const int* nnCount, const int* binIndex, 
                                         const float* input, const float* filter, const float* gradOutput, 
                                         float* gradInput) 
{
    int i = blockIdx.x; // Using blockIdx.x for indexing batch directly
    int j = blockIdx.y * blockDim.x + threadIdx.x; // Combined indexing within the block for 1D thread offset

    if (i < B && j < M * C * r) // Bounds check
    {
        int cout = j % (C * r); // output channel ID
        int cin = cout / r;     // input channel ID
        int m = j / (C * r);    // output point ID
        int nnSize = nnCount[i * M + m];

        for (int k = 0; k < nnSize; k++)
        {
            int n = nnIndex[i * M * K + m * K + k]; // input point ID
            int f = binIndex[i * M * K + m * K + k];

            // Optimize by precomputing common expressions
            float gradOutVal = gradOutput[i * M * C * r + j];
            float filterVal = filter[f * C * r + cout];
            float derIn = gradOutVal * filterVal / nnSize;

            atomicAdd(&gradInput[i * N * C + n * C + cin], derIn);
        }
    }
}