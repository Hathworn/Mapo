#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to perform element-wise multiplication of a vector
extern "C" // ensure function name to be exactly "vmult!"
{
}

__global__ void diag_kernel(const int lengthA, const double *a, double *b)
{
    // Calculate the global index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure index is within bounds and perform operation
    if (i < lengthA) {
        // Access diagonal element more efficiently
        int index = i * (lengthA + 1);
        b[i] = a[index];
    }
}