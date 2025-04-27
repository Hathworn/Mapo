#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_naive_kernel(int *arr, int size, int *sum) {
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use shared memory for local sums
    __shared__ int local_sum;
    if (threadIdx.x == 0) local_sum = 0;
    __syncthreads();

    // Use stride loop improving spatial locality
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        atomicAdd(&local_sum, arr[i]);
    }
    __syncthreads();

    // Atomic add to global sum from one thread per block
    if (threadIdx.x == 0) atomicAdd(sum, local_sum);
}