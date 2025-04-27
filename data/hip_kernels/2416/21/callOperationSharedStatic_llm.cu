#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *res, int k, int p, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n) {
        return;
    }

    __shared__ int s_k, s_p;
    extern __shared__ int s_data[];  // Efficient use of shared memory with dynamic allocation
    int *s_a = s_data;
    int *s_b = s_a + blockDim.x;
    int *s_res = s_b + blockDim.x;

    // Load scalar values into shared memory once
    if (threadIdx.x == 0) {
        s_k = k;
        s_p = p;
    }
    __syncthreads();  // Ensure all threads have the scalar values

    // Load array elements into shared memory
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];
    __syncthreads();  // Ensure all data is loaded before computation

    // Perform computation using shared memory
    s_res[threadIdx.x] = s_a[threadIdx.x] + s_b[threadIdx.x];
    if (s_res[threadIdx.x] > s_k) {
        s_res[threadIdx.x] = s_p;
    }

    // Save results back to global memory
    res[tid] = s_res[threadIdx.x];
}