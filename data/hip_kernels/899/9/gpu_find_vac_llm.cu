#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_find_vac(const int num_atoms, const int correlation_step, const int num_correlation_steps, const float* g_vx, const float* g_vy, const float* g_vz, const float* g_vx_all, const float* g_vy_all, const float* g_vz_all, float* g_vac_x, float* g_vac_y, float* g_vac_z) 
{
    const int num_atoms_sq = num_atoms * num_atoms;
    const int n1n2 = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit for out-of-bounds threads
    if (n1n2 >= num_atoms_sq)
        return;
    
    const int n1 = n1n2 / num_atoms;
    const int n2 = n1n2 - n1 * num_atoms;
    
    // Use temporary variables to reduce redundant calculations
    int base_index = n1 * num_atoms;
    
    for (int k = 0; k < num_correlation_steps; ++k) 
    {
        int nc = correlation_step - k;
        if (nc < 0)
            nc += num_correlation_steps;
        
        // Precompute array offsets
        int vac_offset = nc * num_atoms_sq + n1n2;
        int all_offset = k * num_atoms + n2;
        
        // Avoid redundant global memory accesses
        float vx_val = g_vx[n1];
        float vy_val = g_vy[n1];
        float vz_val = g_vz[n1];
        float vx_all_val = g_vx_all[all_offset];
        float vy_all_val = g_vy_all[all_offset];
        float vz_all_val = g_vz_all[all_offset];
        
        g_vac_x[vac_offset] += vx_val * vx_all_val;
        g_vac_y[vac_offset] += vy_val * vy_all_val;
        g_vac_z[vac_offset] += vz_val * vz_all_val;
    }
}