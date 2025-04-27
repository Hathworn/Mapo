#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Copy_double(double *a, double *b, size_t len)
{
    // Calculate the index for this thread
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use shared memory to avoid repeated global memory access
    __shared__ double sharedMem[256];

    // Directly copy data using shared memory for better cache efficiency
    while (idx < len) {
        sharedMem[threadIdx.x] = a[idx];
        b[idx] = sharedMem[threadIdx.x];

        // Move to the next index for this thread
        idx += blockDim.x * gridDim.x;
    }
}