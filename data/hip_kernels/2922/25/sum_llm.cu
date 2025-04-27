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
    // Calculate global thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Load elements into shared memory for faster access
    extern __shared__ int shared[];
    int n = count / 2;
    if (tid < n)
        shared[tid] = vec1[tid] + vec1[tid + n];
    else
        shared[tid] = 0;
    __syncthreads();

    // Perform parallel reduction using shared memory
    for (unsigned int stride = n / 2; stride > 0; stride >>= 1) {
        if (tid < stride)
            shared[tid] += shared[tid + stride];
        __syncthreads();
    }
    
    // Store result back to global memory
    if (tid == 0)
        *result = shared[0];
}