#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global thread index
    unsigned int k = blockIdx.x * blockDim.x + threadIdx.x + offset;

    // Ensure all threads in a warp have valid memory accesses
    if (k < n) 
    {
        C[k] = A[k - offset] + B[k - offset]; // Use 'k - offset' to prevent recalculation
    }
}