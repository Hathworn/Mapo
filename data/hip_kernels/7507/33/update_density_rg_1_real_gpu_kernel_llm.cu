#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_density_rg_1_real_gpu_kernel(int size__, double const* __restrict__ psi_rg__, double wt__, double* __restrict__ density_rg__)
{
    int ir = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds
    if (ir < size__) {
        double p = psi_rg__[ir];

        // Use FMA operation for better performance
        density_rg__[ir] = fma(p, p * wt__, density_rg__[ir]);
    }
}