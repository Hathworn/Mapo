#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FpropH(float* layer1, const float* synH, const int offset)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Load data into shared memory to optimize memory access
    __shared__ float shared_layer1[256];
    if (threadIdx.y == 0) {
        shared_layer1[threadIdx.x] = layer1[256 * (offset - 1) + i];
    }
    __syncthreads();

    // Use shared memory for the calculation
    atomicAdd(&layer1[256 * offset + j], shared_layer1[i] * synH[i * 256 + j]);
}