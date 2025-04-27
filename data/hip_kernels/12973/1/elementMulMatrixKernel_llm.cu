#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementMulMatrixKernel(double *dev_w, const double *dev_U, const double *dev_V, unsigned int index_row_i, unsigned int index_column_j, unsigned int dim1_U, unsigned int dim1_V)
{
    // Determine global thread index
    unsigned int idx_k = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index range to abort
    if (idx_k >= dim1_U)
        return;

    // Calculate indices for U and V matrices
    unsigned int idx_u_i0 = index_row_i * dim1_U;
    unsigned int idx_v_0j = index_column_j;

    unsigned int idx_u_ik = idx_u_i0 + idx_k;
    unsigned int idx_v_kj = idx_v_0j + idx_k * dim1_V;

    // Perform the element-wise multiplication
    dev_w[idx_k] = dev_U[idx_u_ik] * dev_V[idx_v_kj];
}