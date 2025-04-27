#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_matrix_transpose(int* mat_in, int* mat_out, unsigned int rows, unsigned int cols)
{
    // Calculate the global index for each thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int idy = blockIdx.y * blockDim.y + threadIdx.y;

    // Combine condition checks using logical operators for efficiency
    if (idx < cols && idy < rows)
    {
        // Reduce shared computation of positions
        unsigned int pos = idy * cols + idx;
        unsigned int trans_pos = idx * rows + idy;

        // Directly assign transposed value
        mat_out[trans_pos] = mat_in[pos];
    }
}