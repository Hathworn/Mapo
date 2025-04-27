#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void A_emult_Bg0(const int n, const double *a, const double *b, double *c)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use unswitching to eliminate the redundant addition for b[i] <= 0
    if (i < n && b[i] > 0.0) {
        c[i] += a[i];
    }
}