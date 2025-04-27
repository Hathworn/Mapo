
```cpp
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecReduce(float* g_idata, float* g_odata, int N)
{
    extern __shared__ float sdata[];

    unsigned int tid = threadIdx.x;
    unsigned int globalid = blockIdx.x * blockDim.x + threadIdx.x;

    // Load valid elements into shared memory, else zero
    sdata[tid] = (globalid < N) ? g_idata[globalid] : 0;
    __syncthreads();

    // Reduce using shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s]; // Perform addition directly
        }
        __syncthreads();
    }

    // Write result to global memory using atomic addition
    if (tid == 0) {
        atomicAdd(g_odata, sdata[0]);
    }
}