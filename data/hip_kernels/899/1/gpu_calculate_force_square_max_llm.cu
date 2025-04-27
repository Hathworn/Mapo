#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_calculate_force_square_max(const int size, const int number_of_rounds, const double* __restrict__ force_per_atom, double* force_square_max)
{
    const int tid = threadIdx.x + blockIdx.x * blockDim.x;
    __shared__ double s_force_square[1024];
    
    if (tid < 1024) {
        s_force_square[tid] = 0.0;
    }
    __syncthreads();
    
    double force_square = 0.0;

    for (int round = 0; round < number_of_rounds; ++round) {
        const int n = tid + round * 1024;
        if (n < size) {
            const double f = force_per_atom[n];
            force_square = max(force_square, f * f); // Use max function for performance
        }
    }

    if (tid < 1024) {
        s_force_square[tid] = force_square;
    }
    __syncthreads();

    // Optimized parallel reduction
    for (int offset = blockDim.x >> 1; offset > 0; offset >>= 1) {
        if (tid < offset) {
            s_force_square[tid] = max(s_force_square[tid], s_force_square[tid + offset]);
        }
        __syncthreads();
    }

    if (tid == 0) {
        force_square_max[0] = s_force_square[0];
    }
}