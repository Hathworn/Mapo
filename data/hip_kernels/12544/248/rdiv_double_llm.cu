#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rdiv_double(int n, double *a, double *b, double *sum)
{
    // Calculate global index for this thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use continuous threads to reduce overall loop iterations for larger problem sizes
    int stride = gridDim.x * blockDim.x;

    // Iterate over the array with the thread stride for better throughput
    for (int idx = i; idx < n; idx += stride) {
        sum[idx] = b[idx] / a[idx];
    }
}