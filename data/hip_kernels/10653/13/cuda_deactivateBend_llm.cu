#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_deactivateBend(double* pE, const double* pA, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a register variable to reduce memory access
    if (id < n) {
        double x = pE[id];
        double factor = 0.5 * (x / sqrt(x * x + 1)) + 1;
        pE[id] *= factor;
    }
}