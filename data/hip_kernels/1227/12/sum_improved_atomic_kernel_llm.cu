#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_improved_atomic_kernel(int *arr, int size, int *sum) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int my_sum = 0;

    // Calculate the thread's assigned range with stride
    for (int i = tid; i < size; i += blockDim.x * gridDim.x) {
        my_sum += arr[i];
    }

    // Use shared memory to store the local sum of each thread
    extern __shared__ int smem[];
    smem[threadIdx.x] = my_sum;
    __syncthreads();

    // Parallel reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            smem[threadIdx.x] += smem[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Atomic addition to the global sum
    if (threadIdx.x == 0) {
        atomicAdd(sum, smem[0]);
    }
}