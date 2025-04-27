#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate_kernel(float *x, int n, int groups, float *sum)
{
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= groups) return;

    // Initialize sum to zero
    float temp_sum = 0.0f;

    // Use shared memory to reduce multiple accesses to global memory
    extern __shared__ float shared_x[];

    // Each thread loads its portion of data from global memory to shared memory
    for (int k = threadIdx.x; k < n * groups; k += blockDim.x) {
        shared_x[threadIdx.x] = x[k];
    }
    __syncthreads();

    // Accumulate the sum
    for (int k = 0; k < n; ++k) {
        temp_sum += shared_x[k * groups + i];
    }

    // Write the result back to global memory
    sum[i] = temp_sum;
}