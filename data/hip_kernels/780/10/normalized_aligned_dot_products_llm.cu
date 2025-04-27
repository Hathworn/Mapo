#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void normalized_aligned_dot_products(const double* __restrict__ A, const double divisor, const unsigned int m, const unsigned int n, double* __restrict__ QT)
{
    // Use shared memory if multiple threads in block need the same data
    int a = blockIdx.x * blockDim.x + threadIdx.x;

    // Only compute this when within bounds
    if (a < n) {
        QT[a] = A[a + m - 1] / divisor;
    }
}