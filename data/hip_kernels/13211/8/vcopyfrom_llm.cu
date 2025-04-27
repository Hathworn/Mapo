#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void vcopyfrom(const int n, const int shift, const double *a, double *b)
{
    // Use faster memory access by calculating global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Improve parallelism with loop unrolling; Process multiple elements per thread
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x)
    {
        b[idx] = a[idx + shift];
    }
}