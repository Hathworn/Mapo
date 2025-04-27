#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the offset index
    unsigned int k = i + offset;

    // Check bounds before writing to C
    if (k < n) {
        // Perform vector addition
        C[k] = A[i] + B[i];
    }
}