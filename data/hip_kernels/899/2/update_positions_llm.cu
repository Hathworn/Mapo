#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_positions(const int size, const double position_step, const double* force_per_atom, const double* position_per_atom, double* position_per_atom_temp)
{
    const int n = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (n < size) {
        // Optimize by storing force in a register
        const double force = force_per_atom[n];
        
        // Combine operations to reduce memory access
        position_per_atom_temp[n] = position_per_atom[n] + force * position_step;
    }
}