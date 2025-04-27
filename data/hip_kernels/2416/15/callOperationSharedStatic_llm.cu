#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *res, int n) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid >= n) {
        return;
    }

    // Allocation of shared memory
    extern __shared__ int sharedMem[];
    int* s_a = sharedMem;
    int* s_b = &s_a[blockDim.x];
    int* s_res = &s_b[blockDim.x];

    // Load inputs from global to shared memory
    s_a[threadIdx.x] = a[tid];
    s_b[threadIdx.x] = b[tid];
    __syncthreads(); // Ensure all threads have loaded inputs

    // Perform operation
    int local_res = s_a[threadIdx.x] - s_b[threadIdx.x];
    if (local_res < 0) {
        local_res = 0;
    }

    // Write result to shared memory
    s_res[threadIdx.x] = local_res;
    __syncthreads(); // Ensure operation is complete before writing results back

    // Store result back to global memory
    res[tid] = s_res[threadIdx.x];
}