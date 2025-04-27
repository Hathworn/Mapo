#include "hip/hip_runtime.h"
#include "includes.h"

//#define array_size 100000000
#define array_size 101

hipError_t addWithCuda(int *total);

__shared__ int temp[array_size];

__global__ void addKernel(int *tid_c, int *tid_total)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < array_size)
    {
        tid_c[tid] = tid;
        temp[threadIdx.x] = tid;

        // Use __syncthreads to ensure all threads have written to shared memory
        __syncthreads();

        // Only thread 0 in each block performs the atomic addition
        if (threadIdx.x == 0)
        {
            int block_sum = 0;
            for (int i = 0; i < blockDim.x; i++)
            {
                // Accumulate current block's contribution
                block_sum += temp[i];
            }
            // Perform atomic addition with the accumulated block sum
            atomicAdd(tid_total, block_sum);
        }
    }
}