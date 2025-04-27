#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Fprop2(const float* layer1, const float* syn2, float* out, const int offset)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x; // Compute global index
    int k = blockDim.y * blockIdx.y + threadIdx.y; // Compute global index
    float temp = layer1[256 * offset + k] * syn2[k * 4 + i]; // Calculate temporary result

    // Use shared memory to reduce contention on atomic operations
    __shared__ float sharedOut[1024]; // Adjust size according to your blockDim.x
    sharedOut[threadIdx.x] = 0.0;
    __syncthreads();

    atomicAdd(&sharedOut[threadIdx.x], temp); // Local atomic addition
    __syncthreads();

    atomicAdd(&out[i], sharedOut[threadIdx.x]); // Global atomic addition
}
```
