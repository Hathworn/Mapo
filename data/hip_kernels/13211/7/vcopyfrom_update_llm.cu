#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}
__global__ void vcopyfrom_update(const int n, const int shift, const double *a, double *b)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n)  // Boundary check
    {
        b[i] += __ldg(&a[i + shift]);  // Use __ldg for read-only data cache
    }
}