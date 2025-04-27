#include "hip/hip_runtime.h"
#include "includes.h"
// B=diagm(A)

extern "C"
{
}
__global__ void diagm_kernel(const int lengthA, const double *a, double *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to handle elements beyond grid size
    for (int idx = i; idx < lengthA; idx += blockDim.x * gridDim.x)
    {
        b[idx + idx * lengthA] = a[idx];
    }
}