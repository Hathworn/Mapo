#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addOneColumnPerThread(double* a, double* b, double* c, int n)
{
    // Get the column for current thread
    int column = (blockIdx.x * blockDim.x + threadIdx.x);

    // Ensure thread does useful work
    if (column < n)
    {
        int offset = column;  // Precompute offset
        int stride = n;       // Avoid recalculating stride
        for (int i = 0; i < n; i++)
        {
            // Use precomputed values for better performance
            c[i * stride + offset] = a[i * stride + offset] + b[i * stride + offset];
        }
    }
}