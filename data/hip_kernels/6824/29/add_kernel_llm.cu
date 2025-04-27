#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to enhance memory access patterns if needed
// Use flexible grid-stride loop for better workload distribution 
__global__ void add_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = idx; i < N; i += stride)
    {
        X[i * INCX] += ALPHA;
    }
}