#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max_pool3d_backward(int B, int N, int M, int C, const int* maxIndex, const float* gradOutput, float* gradInput)
{
    int i = blockIdx.x; // Use blockIdx.x for indexing over B
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Improved indexing with stride to ensure all elements are covered
    for (int j = threadId; j < M * C; j += stride)
    {
        int c = j % C;
        int n = maxIndex[i * M * C + j];
        atomicAdd(&gradInput[i * N * C + n * C + c], gradOutput[i * M * C + j]);
    }
}