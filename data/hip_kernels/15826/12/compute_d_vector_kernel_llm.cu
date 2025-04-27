#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_d_vector_kernel(int N_i, int* d_ind, double* d_ptr, int* p_ptr, double* N_ptr, int N_ld) {
    int I = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure I is within the bounds
    if (I >= N_i) return;

    int idx = d_ind[I];
    int index = p_ptr[idx];

    // Inline multiplication to reduce indexing overhead
    d_ptr[idx] = 1.0 / N_ptr[index * (N_ld + 1)];
}