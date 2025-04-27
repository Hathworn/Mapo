#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void vcopyshift(const int n, const int shift, const double *a, double *b)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    if (i < n) // Ensure we do not access out of bounds
    {
        b[i + shift] = a[i]; // Perform the copy with shift
    }
}