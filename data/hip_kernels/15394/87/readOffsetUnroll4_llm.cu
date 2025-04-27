#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void readOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the starting index for this thread, considering unrolling
    unsigned int i = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int k = i + offset;

    // Load data in registers for maximizing memory throughput
    float a_val1, b_val1, a_val2, b_val2, a_val3, b_val3, a_val4, b_val4;
    
    // Check if reads are within bounds and process in batches
    if (k < n) {
        a_val1 = A[k]; 
        b_val1 = B[k];
        C[i] = a_val1 + b_val1;
    }
    if (k + blockDim.x < n) {
        a_val2 = A[k + blockDim.x]; 
        b_val2 = B[k + blockDim.x];
        C[i + blockDim.x] = a_val2 + b_val2;
    }
    if (k + 2 * blockDim.x < n) {
        a_val3 = A[k + 2 * blockDim.x]; 
        b_val3 = B[k + 2 * blockDim.x];
        C[i + 2 * blockDim.x] = a_val3 + b_val3;
    }
    if (k + 3 * blockDim.x < n) {
        a_val4 = A[k + 3 * blockDim.x]; 
        b_val4 = B[k + 3 * blockDim.x];
        C[i + 3 * blockDim.x] = a_val4 + b_val4;
    }
}