#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_reduction(int* shared_var, int* input_values, int N, int iters) {
    __shared__ int local_mem[256];
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    for (int iter = 0; iter < iters; iter++) {
        if (tid < N) {
            local_mem[local_tid] = input_values[tid];
        } else {
            local_mem[local_tid] = 0; // Ensure valid data for threads beyond N
        }

        __syncthreads(); // Synchronize to ensure all loads are complete

        // Use parallel reduction within shared memory
        for (int stride = 1; stride < blockDim.x; stride *= 2) {
            int index = 2 * stride * local_tid;
            if (index < blockDim.x) {
                local_mem[index] += local_mem[index + stride];
            }
            __syncthreads(); // Synchronize to ensure stride computation is complete
        }

        if (local_tid == 0) {
            atomicAdd(shared_var, local_mem[0]); // Only sum from thread 0 is added to shared var
        }
    }
}