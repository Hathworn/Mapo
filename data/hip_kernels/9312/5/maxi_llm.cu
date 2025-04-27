#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void maxi(int * a, int * b, int n) {

    __shared__ int local_max[256]; // Shared memory for partial maximum

    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int local_max_val = (idx < n) ? a[idx] : INT_MIN; // Initialize local max

    // Reduce within block
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        __syncthreads(); // Ensure all threads have written their values
        if (threadIdx.x < stride) {
            int other = local_max_val;
            if (idx + stride < n) other = a[idx + stride];
            local_max_val = max(local_max_val, other);
        }
    }

    // Store the result from the first thread in each block
    if (threadIdx.x == 0) {
        b[blockIdx.x] = local_max_val;
    }
}