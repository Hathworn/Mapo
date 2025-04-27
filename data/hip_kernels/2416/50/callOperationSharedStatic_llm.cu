#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *c, int n)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if thread ID is within bounds
    if (tid >= n) {
        return;
    }

    // Use stack memory for small fixed-size shared memory allocation
    __shared__ int s_a[1024], s_b[1024];

    // Load values from global to shared memory
    int val_a = a[tid];
    int val_b = b[tid];
    s_a[threadIdx.x] = val_a;
    s_b[threadIdx.x] = val_b;
    __syncthreads(); // Synchronize to ensure all loads are done

    // Perform the operation using the variables from shared memory
    int result = (s_a[threadIdx.x] >= s_b[threadIdx.x]) ? s_a[threadIdx.x] : s_b[threadIdx.x];

    // Write the result back to global memory
    c[tid] = result;
}