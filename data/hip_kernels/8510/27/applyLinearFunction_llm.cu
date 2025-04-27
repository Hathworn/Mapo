#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void applyLinearFunction(int *size, const short *x, short *y, short *a, short *b) {
    // Use local int variable to reduce global memory access
    const int size_local = *size;
    const short a_local = *a;
    const short b_local = *b;
    
    const long ix = threadIdx.x + blockIdx.x * (long)blockDim.x;
    
    // Add bounds check to ensure valid memory access
    if (ix < size_local) {
        // Compute linear function using local variables
        y[ix] = a_local + b_local * x[ix];
    }
}