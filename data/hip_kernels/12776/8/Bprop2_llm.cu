#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize shared memory for improved access speed
__global__ void Bprop2(const float* layer1, float* dsyn2, const float* out, const float alpha)
{
    int i = threadIdx.x; // 256
    int j = blockDim.y * blockIdx.y + threadIdx.y; // 10
    int k = blockIdx.x;  // Data.count

    extern __shared__ float shared_layer1[];
    
    // Load data into shared memory to reduce global memory accesses
    shared_layer1[threadIdx.x] = layer1[256 * k + i];
    __syncthreads();

    atomicAdd(&dsyn2[i * 10 + j], out[k * 10 + j] * shared_layer1[threadIdx.x] * alpha);
}