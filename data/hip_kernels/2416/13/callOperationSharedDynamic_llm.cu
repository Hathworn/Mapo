#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void callOperationSharedDynamic(int *a, int *res, int x, int n)
{
    int tidx = blockDim.x * blockIdx.x + threadIdx.x;
    int tidy = blockDim.y * blockIdx.y + threadIdx.y;

    if (tidx >= n || tidy >= n) {
        return;
    }

    int tid = tidx * n + tidy;

    extern __shared__ int data[];

    int *s_a = data;
    int *s_res = &s_a[n * n];  // Fix incorrect size calculation

    __shared__ int s_x;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        s_x = x;  // Optimize by loading x only once
    }
    __syncthreads();  // Ensure s_x is loaded before use

    s_a[tid] = a[tid];
    __syncthreads();  // Ensure all data is loaded before computation

    s_res[tid] = s_a[tid] * s_x;
    res[tid] = s_res[tid];
}