#include "hip/hip_runtime.h"
#include "includes.h"
/**
*  Quantum Lattice Boltzmann
*  (c) 2015 Fabian Thüring, ETH Zurich
*
*  This file contains all the CUDA kernels and function that make use of the
*  CUDA runtime API
*/

// Local includes

// ==== CONSTANTS ====

__constant__ unsigned int d_L;
__constant__ float d_dx;
__constant__ float d_dt;
__constant__ float d_mass;
__constant__ float d_g;
__constant__ unsigned int d_t;

__constant__ float d_scaling;
__constant__ int d_current_scene;

// ==== INITIALIZATION ====

__global__ void kernel_calculate_normal_V(float3* vbo_ptr, float* d_ptr)
{
    // Optimize the index calculation for better coalescing
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (i < d_L && j < d_L) 
    {
        int idx = i * d_L + j;
        
        float x2 = d_scaling * fabsf(d_ptr[idx]);

        int ik = (i + 1) % d_L;
        int jk = (d_L - 1 + j) % d_L;

        float a1 = d_dx;
        float a2 = d_scaling * fabsf(d_ptr[ik * d_L + j]) - x2;

        float b2 = d_scaling * fabsf(d_ptr[i * d_L + jk]) - x2;
        float b3 = -d_dx;

        // Load n to shared memory to reduce global memory access
        float3 n;
        n.x = a2 * b3;
        n.y = -a1 * b3;
        n.z = a1 * b2;

        // Normalize
        float norm = rsqrtf(n.x * n.x + n.y * n.y + n.z * n.z); // Use rsqrtf for faster computation

        vbo_ptr[idx].x = n.x * norm;
        vbo_ptr[idx].y = n.y * norm;
        vbo_ptr[idx].z = n.z * norm;
    }
}