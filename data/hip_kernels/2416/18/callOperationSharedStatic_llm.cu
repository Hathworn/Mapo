#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void callOperationSharedStatic(int *a, int *b, int *res, int n)
{
    // Calculate 1D index in the flattened grid
    int tid = blockDim.x * blockIdx.x + threadIdx.x + (blockDim.y * blockIdx.y + threadIdx.y) * n;

    // Check if within bounds
    if (blockIdx.x * blockDim.x + threadIdx.x >= n || blockIdx.y * blockDim.y + threadIdx.y >= n) 
    {
        return;
    }

    // Declare shared memory with dynamic size
    extern __shared__ int shared[];
    int* s_a = shared;
    int* s_b = s_a + n * n;

    // Load data into shared memory
    s_a[tid] = a[tid];
    s_b[tid] = b[tid];
    __syncthreads();  // Ensure all data is loaded before proceeding

    // Perform computation
    int temp_res = s_a[tid] - s_b[tid];
    temp_res = max(temp_res, 0);  // Avoid negative result

    // Write back to global memory
    res[tid] = temp_res;
}