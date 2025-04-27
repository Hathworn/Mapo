#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_copy_mass(const int num_atoms, const int* __restrict__ g_group_contents, const double* __restrict__ g_mass_i, double* __restrict__ g_mass_o)
{
    // Optimize: Use shared memory to minimize redundant memory access
    extern __shared__ int shared_group_contents[];

    const int tx = threadIdx.x;
    const int n = tx + blockIdx.x * blockDim.x;
    
    if (tx < num_atoms) {
        shared_group_contents[tx] = g_group_contents[tx + blockIdx.x * blockDim.x];
    }
    __syncthreads();
    
    if (n < num_atoms) {
        g_mass_o[n] = g_mass_i[shared_group_contents[tx]];
    }
}