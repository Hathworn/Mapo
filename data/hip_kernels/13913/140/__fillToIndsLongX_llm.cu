#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToIndsLongX(long long A, long long *B, long long len) {
    // Calculate global index using built-in function for better performance
    int tid = blockIdx.x * blockDim.x + threadIdx.x + 
              blockIdx.y * gridDim.x * blockDim.x;
    int step = blockDim.x * gridDim.x * gridDim.y;

    // Loop unrolling for improved performance
    for (long long i = tid; i < len; i += step) {
        B[i] = A;
    }
}