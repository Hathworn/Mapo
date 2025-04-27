#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Fprop1(const float* in, const float* syn1, float* layer1)
{
    int i = threadIdx.x;                         
    int j = blockDim.y * blockIdx.y + threadIdx.y; 
    int k = blockIdx.x;                          

    // Allocate shared memory for partial results
    __shared__ float partialSum[256][64]; 
    partialSum[i][threadIdx.y] = in[64 * k + j] * syn1[j * 256 + i];
    __syncthreads();

    // Use a single thread to accumulate results for each output element
    if (threadIdx.y == 0) {
        float sum = 0.0f;
        for (int t = 0; t < blockDim.y; ++t) {
            sum += partialSum[i][t];
        }
        atomicAdd(&layer1[256 * k + i], sum);
    }
}