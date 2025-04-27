#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_by_veff_real_real_gpu_kernel(int nr__, double* buf__, double const* veff__)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop with step size equal to total number of threads
    for (; i < nr__; i += blockDim.x * gridDim.x) {
        buf__[i] *= veff__[i];
    }
}