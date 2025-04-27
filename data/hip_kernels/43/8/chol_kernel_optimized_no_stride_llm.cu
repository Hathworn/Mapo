#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void chol_kernel_optimized_no_stride(float * U, int k, int stride) {
    // Iterators
    unsigned int num_rows = MATRIX_SIZE;

    // Calculate the current i iteration
    int i = blockIdx.x + (k + 1);

    // Determine the start and end indices for j based on stride and thread index
    int offset = i;
    int jstart = (threadIdx.x * stride) + offset;
    int jend = jstart + (stride - 1);

    // Boundary check to ensure j remains in bounds
    if (jstart <= num_rows - 1) {
        jend = min(jend, num_rows - 1);

        // Perform computations for this i iteration
        for (int j = max(jstart, i); j <= jend; j++) {
            U[i * num_rows + j] -= U[k * num_rows + i] * U[k * num_rows + j];
        }
    }
}