#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copy_velocity(const int num_atoms, const double* __restrict__ g_vx_i, const double* __restrict__ g_vy_i, const double* __restrict__ g_vz_i, double* __restrict__ g_vx_o, double* __restrict__ g_vy_o, double* __restrict__ g_vz_o)
{
    // Calculate global thread index
    const int n = threadIdx.x + blockIdx.x * blockDim.x;
    // Ensure thread is within bounds
    if (n < num_atoms) {
        // Copy velocities using memory coalescing
        g_vx_o[n] = g_vx_i[n];
        g_vy_o[n] = g_vy_i[n];
        g_vz_o[n] = g_vz_i[n];
    }
}