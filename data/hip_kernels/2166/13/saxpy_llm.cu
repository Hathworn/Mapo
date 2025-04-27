#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy(int * a, int * b, int * c)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-strided loop for better memory throughput
    int stride = blockDim.x * gridDim.x;
    for (int i = tid; i < N; i += stride) {
        c[i] = 2 * a[i] + b[i]; // Perform SAXPY operation
    }
}