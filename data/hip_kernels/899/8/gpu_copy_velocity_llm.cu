#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copy_velocity(const int num_atoms, const double* __restrict__ g_vx_i, const double* __restrict__ g_vy_i, const double* __restrict__ g_vz_i, float* __restrict__ g_vx_o, float* __restrict__ g_vy_o, float* __restrict__ g_vz_o)
{
    const int n = threadIdx.x + blockIdx.x * blockDim.x;
    if (n < num_atoms) {
        // Cast directly to float to avoid intermediate conversions
        g_vx_o[n] = static_cast<float>(g_vx_i[n]);
        g_vy_o[n] = static_cast<float>(g_vy_i[n]);
        g_vz_o[n] = static_cast<float>(g_vz_i[n]);
    }
}