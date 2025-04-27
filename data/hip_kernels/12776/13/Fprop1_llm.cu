#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Fprop1(const float* in, const float* syn1, float* layer1)
{
    int i = threadIdx.x;                         // 256
    int k = blockIdx.x;                          // Data.count

    // Using shared memory to optimize access
    extern __shared__ float shared_syn1[];
    
    // Load syn1 into shared memory
    for (int j = threadIdx.x; j < 28*28; j += blockDim.x) {
        shared_syn1[j] = syn1[j*256 + i];
    }
    __syncthreads();

    float x = 0.0;
    for (int j = 0; j < 28*28; ++j) {
        x += in[k*28*28 + j] * shared_syn1[j];
    }
    layer1[k*256 + i] = x;
}