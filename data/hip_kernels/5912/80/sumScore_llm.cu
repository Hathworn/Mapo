#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumScore(double *score, int full_size, int half_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to minimize global memory access
    extern __shared__ double sharedScore[];
    
    for (int tid = threadIdx.x; tid < half_size; tid += blockDim.x) {
        sharedScore[tid] = score[tid];
        __syncthreads(); // Ensure all threads have updated shared memory

        if (tid + half_size < full_size) {
            sharedScore[tid] += score[tid + half_size];
        }
        __syncthreads(); // Ensure all updates are completed before writing back

        score[tid] = sharedScore[tid];
    }
}