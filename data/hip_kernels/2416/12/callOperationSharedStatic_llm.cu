#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *res, int x, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n) {
        return;
    }

    int tid = tidx * n + tidy;

    extern __shared__ int shared_memory[];  // Use dynamic shared memory
    int* s_a = shared_memory;
    int* s_res = &s_a[n * n];
    int* s_x = &s_res[n * n];

    // Load 'x' only once into shared memory
    *s_x = x;

    // Load input array to shared memory
    s_a[tid] = a[tid];
    __syncthreads();  // Ensure all loads to shared memory are complete

    // Perform computation using shared memory
    s_res[tid] = s_a[tid] * (*s_x);

    // Write back the results
    res[tid] = s_res[tid];
}