#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add3(float *val1, float *val2, int *num_elem)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    int total_threads = gridDim.x * blockDim.x; // Calculate total threads

    for (int idx = i; idx < *num_elem; idx += total_threads) { // Loop to cover all elements
        val1[idx] += val2[idx]; // Perform addition
    }
}