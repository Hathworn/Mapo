#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void big_add(int *a, int *b, int *c, unsigned int N)
{
    // Calculate the global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using shared memory if possible (not applicable here as it's a direct add)
    // Loop over the array with increments of the total number of threads
    for (int i = tid; i < N; i += blockDim.x * gridDim.x) {
        c[i] = a[i] + b[i]; // Addition operation
    }
}