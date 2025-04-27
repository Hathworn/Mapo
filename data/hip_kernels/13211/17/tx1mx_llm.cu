#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void tx1mx(const int lengthX, const double *t, const double *x, double *z)
{
    // Use shared memory for better memory coalescing
    extern __shared__ double sharedX[];
    
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    if (i < lengthX)
    {
        // Load data into shared memory
        sharedX[threadIdx.x] = x[i];
        __syncthreads();

        // Perform computation with shared memory
        double xi = sharedX[threadIdx.x];
        z[i] += t[i] * xi * (1.0 - xi);
    }
}