```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_reduce_kernel (int N, float * vector, float * sum)
{
    extern __shared__ float partialSum[];
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int lane = threadIdx.x;

    partialSum[lane] = 0.f;

    __syncthreads();

    for (int i = tid; i < N; i += blockDim.x * gridDim.x)
    {
        partialSum[lane] += vector[i];
    }

    __syncthreads();

    // Reduction using warp shuffles for better performance
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (lane < stride)
        {
            partialSum[lane] += partialSum[lane + stride];
        }
        __syncthreads();  // Synchronize threads within block
    }

    if (lane == 0)
    {
        atomicAdd(sum, partialSum[0]);  // Use atomic operation to safely update global sum
    }
}