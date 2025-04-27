```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Bprop2(const float* __restrict__ layer1, float* __restrict__ dsyn2, const float* __restrict__ out, const float alpha)
{
    int i = threadIdx.x; //256
    int j = blockDim.y * blockIdx.y + threadIdx.y; //10
    int k = blockIdx.x;  //Data.count

    // Utilize shared memory to minimize global memory access
    __shared__ float sharedLayer[256];

    // Load layer1 into shared memory
    sharedLayer[i] = layer1[256 * k + i];
    __syncthreads();

    // Perform computation and atomic addition
    atomicAdd(&dsyn2[i * 10 + j], out[k * 10 + j] * sharedLayer[i] * alpha);
}