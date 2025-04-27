#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copy_velocity( const int num_atoms, const int offset, const int* __restrict__ g_group_contents, const double* __restrict__ g_vx_i, const double* __restrict__ g_vy_i, const double* __restrict__ g_vz_i, double* __restrict__ g_vx_o, double* __restrict__ g_vy_o, double* __restrict__ g_vz_o)
{
    const int n = threadIdx.x + blockIdx.x * blockDim.x;
    if (n < num_atoms) {
        const int m = g_group_contents[offset + n];
        
        // Optimize memory access pattern by coalescing
        g_vx_o[n] = g_vx_i[m];
        g_vy_o[n] = g_vy_i[m];
        g_vz_o[n] = g_vz_i[m];
    }
}