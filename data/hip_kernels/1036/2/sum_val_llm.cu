#include "hip/hip_runtime.h"
#include "includes.h"

int numSMs;

__global__ void sum_val(double* val, double* r) {
    // Using shared memory for better performance
    extern __shared__ double shared_val[];
    int index = threadIdx.x;

    // Load data into shared memory
    shared_val[index] = val[index];
    __syncthreads();

    // Perform parallel reduction in shared memory
    for (int i = 1; i < blockDim.x; i <<= 1) {
        int pair_index = index + i;
        if (index % (i << 1) == 0 && pair_index < blockDim.x) {
            shared_val[index] += shared_val[pair_index];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (index == 0) {
        r[0] = shared_val[0];
    }
}