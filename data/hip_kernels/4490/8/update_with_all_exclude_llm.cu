#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_with_all_exclude(int *clause_output, int *all_exclude)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Use shared memory to reduce global memory access
    __shared__ int shared_exclude[CLAUSES];

    // Load data into shared memory
    for (int j = index; j < CLAUSES; j += stride) {
        shared_exclude[j] = all_exclude[j];
    }
    __syncthreads();

    // Update clause output with shared memory
    for (int j = index; j < CLAUSES; j += stride) {
        if (shared_exclude[j] == 1) {
            clause_output[j] = 0;
        }
    }
}