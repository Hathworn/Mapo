#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(float *F, double *D)
{
    // Calculate global thread ID
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to set and test for only tid 0
    __shared__ bool isSet;
    if (threadIdx.x == 0) {
        *F = 12.1f;  // Use literal suffix for float
        *D = 12.1;
        isSet = true; // Set flag in shared memory
    }
    __syncthreads();

    if (isSet && tid == 0) {
        // Task for tid 0 only, after flag is set
    }
}