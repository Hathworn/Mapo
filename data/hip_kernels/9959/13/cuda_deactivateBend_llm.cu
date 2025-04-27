#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_deactivateBend(double* pE, const double* pA, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n) {
        double x = pE[id];
        // Precompute commonly used term
        double factor = 0.5 / sqrt(x * x + 1);
        // Reduce operations by reusing precomputed term
        pE[id] *= factor * x + 1;
    }
}