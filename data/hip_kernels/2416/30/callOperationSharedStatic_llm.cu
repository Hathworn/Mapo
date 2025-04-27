#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *res, int k, int p, int n) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid >= n) {
        return;
    }

    // Declare shared memory as extern to avoid fixed size allocation
    extern __shared__ int shared_data[];
    int* s_a = shared_data;
    int* s_b = s_a + n;
    int* s_res = s_b + n;

    // Allocate shared scalars
    __shared__ int s_k, s_p;

    s_k = k; 
    s_p = p;
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];

    // Perform computation using shared memory
    s_res[tid] = s_a[tid] - s_b[tid];
    if (s_res[tid] < s_k) {
        s_res[tid] = s_p;
    }

    // Write result back to global memory
    res[tid] = s_res[tid];
}