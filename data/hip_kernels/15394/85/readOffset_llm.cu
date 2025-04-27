#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffset(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate global index with offset in shared memory for better performance
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;

    if (k < n) {
        // Ensure coalesced memory access by reading and writing sequential elements
        float a_val = A[k]; 
        float b_val = B[k];
        C[i] = a_val + b_val;
    }
}