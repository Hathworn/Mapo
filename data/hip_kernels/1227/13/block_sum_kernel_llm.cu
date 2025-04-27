#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void block_sum_kernel(int *arr, int size, int *block_sums) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int my_sum = 0;
    __shared__ int smem[128];

    // Use block-level instead of grid-level striding for better occupancy
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        my_sum += arr[i];
    }
    smem[threadIdx.x] = my_sum;

    // Barrier then use parallel reduction to get block sum
    __syncthreads();
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {  // Use bit shift for division by 2
        if (threadIdx.x < i) {
            smem[threadIdx.x] += smem[threadIdx.x + i];
        }
        __syncthreads();
    }
    // Block sum added to global arr
    if (threadIdx.x == 0) {
        block_sums[blockIdx.x] = smem[0];
    }
}