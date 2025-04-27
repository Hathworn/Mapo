#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void get_c_size(int *d_c_size, int *d_full_cl, int size)
{
    // Calculate unique thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Exit if the thread index exceeds the input size
    if (i >= size) return;

    // Use fast atomic CAS increment to improve atomicAdd
    if (d_full_cl[i] != 0) {
        atomicCAS(d_c_size, atomicAdd(d_c_size, 1), *d_c_size); 
    }
}