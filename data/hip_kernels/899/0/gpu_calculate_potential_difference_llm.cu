#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_calculate_potential_difference(const int size, const int number_of_rounds, const double* potential_per_atom, const double* potential_per_atom_temp, double* potential_difference)
{
    __shared__ double s_diff[1024];

    // Initialize shared memory
    s_diff[threadIdx.x] = 0.0;

    double diff = 0.0;

    // Use a single loop and reduce the number of accesses to global memory
    for (int n = threadIdx.x; n < size; n += blockDim.x) {
        if (n < size) {
            diff += potential_per_atom_temp[n] - potential_per_atom[n];
        }
    }

    // Store calculated difference in shared memory
    s_diff[threadIdx.x] = diff;
    __syncthreads();

    // Reduce sum within block using efficient reduction pattern
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            s_diff[threadIdx.x] += s_diff[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write result from block to global memory
    if (threadIdx.x == 0) {
        atomicAdd(&potential_difference[0], s_diff[0]);
    }
}