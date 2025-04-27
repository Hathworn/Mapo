#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedDynamic(int *a, int *b, int *res, int k, int p, int n) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid >= n) return;

    extern __shared__ int data[]; // Shared memory declaration

    // Pointer initializations for shared memory arrays
    int *s_a = data;
    int *s_b = &s_a[n];
    int *s_res = &s_b[n];

    s_a[tid] = a[tid];  // Load input data to shared memory
    s_b[tid] = b[tid];

    // Directly compute and store results in shared memory
    int temp_res = s_a[tid] - s_b[tid];
    s_res[tid] = (temp_res < k) ? p : temp_res;

    res[tid] = s_res[tid];  // Copy result back to global memory
}