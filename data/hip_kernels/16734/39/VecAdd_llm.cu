#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const int* A, const int* B, int* C, int size)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Ensure the current thread does not exceed the size
    if (i < size) {
        int temp = 0;
        // Accumulate temporary sum to reduce global memory accesses
        for(int n = 0; n < 100; n++) {
            temp += A[i] + B[i];
        }
        C[i] += temp;
    }
}