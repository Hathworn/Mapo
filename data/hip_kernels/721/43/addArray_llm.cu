#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addArray(float *d_a, float *d_b, float *d_c, int size)
{
    // Use shared memory for caching inputs
    extern __shared__ float shared_a[];
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int t = threadIdx.x;

    if (i < size)
    {
        // Load inputs into shared memory
        shared_a[t] = d_a[i];
        __syncthreads();

        if (i < size)
        {
            // Efficient array addition using shared memory
            d_c[i] = shared_a[t] + d_b[i];
        }
    }
}