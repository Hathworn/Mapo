```cuda
#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}
__global__ void vmultbang(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x; // Calculate the stride for each thread

    for (; i < lengthA; i += stride) // Use stride loop for increased efficiency
    {
        c[i] = alpha * a[i] * b[i];  // Perform the computation
    }
}