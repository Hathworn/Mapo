#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_c_size(int *d_c_size, int *d_full_cl, int size)
{
    // Calculate the global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if index is within the array bounds
    if (i < size) {
        // Use atomic add only if condition is met to minimize divergence
        if (d_full_cl[i] != 0) {
            atomicAdd(d_c_size, 1);
        }
    }
}