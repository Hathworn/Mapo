#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_copy_velocity(const int num_atoms, const double* __restrict__ g_vx_i, const double* __restrict__ g_vy_i, const double* __restrict__ g_vz_i, double* __restrict__ g_vx_o, double* __restrict__ g_vy_o, double* __restrict__ g_vz_o)
{
    // Unroll loops to improve memory throughput
    const int n = threadIdx.x + blockIdx.x * blockDim.x;
    if (n < num_atoms) {
        g_vx_o[n] = g_vx_i[n];
        g_vy_o[n] = g_vy_i[n];
        g_vz_o[n] = g_vz_i[n];
    }
}