```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToIndsLong(long long A, long long *B, int *I, long long len) {
    // Calculate unique global thread ID in 3D grid
    int tid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    // Calculate step size based on total number of threads
    int step = blockDim.x * gridDim.x * gridDim.y;

    // Iterate over indices for this thread
    for (long long i = tid; i < len; i += step) {
        B[I[i]] = A;  // Assign value to the specified index
    }
}