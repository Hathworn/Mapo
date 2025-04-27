#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/





/****** Double precision *****/







#ifdef __cplusplus
}
#endif
__global__ void sum(int* vec1, int* result, int* tmp1, const int count)
{
    // Load and sum elements in shared memory for faster access
    extern __shared__ int shared[];
    int tid = threadIdx.x;
    int global_tid = blockDim.x * blockIdx.x + tid;
    if (global_tid < count)
        shared[tid] = vec1[global_tid];
    else
        shared[tid] = 0; // Initialize padding with zero
    __syncthreads();

    // Use shared memory for parallel reduction
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (tid < stride)
        {
            shared[tid] += shared[tid + stride];
        }
        __syncthreads();
    }

    // Only the first thread in each block will add its result to final output
    if (tid == 0)
    {
        atomicAdd(result, shared[0]);
    }
}