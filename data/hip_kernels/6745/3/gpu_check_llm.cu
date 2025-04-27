#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_check(int threads, uint64_t *data, uint32_t *results, uint64_t target)
{
    __shared__ uint32_t tmp[512/32];

    int thread = (blockDim.x * blockIdx.x + threadIdx.x);

    // Initialize shared memory array using all threads in warp
    int warpIndex = threadIdx.x / 32;
    int laneIndex = threadIdx.x % 32;
    if (laneIndex == 0) 
        tmp[warpIndex] = 0;

    __syncthreads();

    if (thread < threads)
    {
        uint64_t highword = data[threads*3 + thread];
        if(highword < target){
            atomicOr(&tmp[warpIndex], 1 << laneIndex); // Coalesced atomic operation
        }

        __syncthreads();
        if (laneIndex == 0) // Store final result using a single thread per warp
            results[blockIdx.x*(4096/32) + warpIndex] = tmp[warpIndex];
    }
}