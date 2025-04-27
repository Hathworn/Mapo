#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mul_by_veff_real_real_gpu_kernel(int nr__, double* buf__, double const* veff__)
{
    // Optimize block index calculation and check
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < nr__) {
        buf__[idx] *= veff__[idx]; // Streamline multiplication operation
    }
}