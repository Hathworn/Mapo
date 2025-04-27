#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedDynamic(int *a, int *b, int *c, int n) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Early return for threads out of range
    if (tid >= n) return;

    extern __shared__ int data[];

    int *s_a = data;
    int *s_b = &s_a[blockDim.x];
    int *s_c = &s_b[blockDim.x];

    // Load a and b into shared memory
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];

    __syncthreads(); // Ensure all loads to shared memory are complete

    // Perform the operation
    s_c[threadIdx.x] = (s_a[threadIdx.x] >= s_b[threadIdx.x]) ? s_a[threadIdx.x] : s_b[threadIdx.x];

    // Write the result back to global memory
    c[tid] = s_c[threadIdx.x];
}