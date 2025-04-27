#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate the thread's global index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum accumulator to zero
    float local_sum = 0;

    // Use shared memory to optimize memory access within a block
    extern __shared__ float shared_x[];
    for (int k = threadIdx.x; k < n; k += blockDim.x) {
        shared_x[threadIdx.x] = x[k * groups + i];
        __syncthreads(); // Synchronization point

        // Accumulate sum in local variable
        local_sum += shared_x[threadIdx.x];
        __syncthreads(); // Ensure all threads have completed reading and writing
    }

    // Write the result back to global sum array
    sum[i] = local_sum;
}