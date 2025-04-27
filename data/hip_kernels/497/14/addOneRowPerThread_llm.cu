#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addOneRowPerThread(double* a, double* b, double* c, int n)
{
    // Calculate the row for current thread
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Unrolling to reduce loop overhead and improving memory coalescing
    if (row < n)
    {
        int idx = row * n;
        int i = 0;

        #pragma unroll
        for (; i <= n - 4; i += 4)
        {
            c[idx + i]     = a[idx + i]     + b[idx + i];
            c[idx + i + 1] = a[idx + i + 1] + b[idx + i + 1];
            c[idx + i + 2] = a[idx + i + 2] + b[idx + i + 2];
            c[idx + i + 3] = a[idx + i + 3] + b[idx + i + 3];
        }

        // Handle the rest of the elements
        for (; i < n; i++)
        {
            c[idx + i] = a[idx + i] + b[idx + i];
        }
    }
}