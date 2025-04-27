#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cg_init_k(const int x_inner, const int y_inner, const int halo_depth, const double* __restrict__ w, double* __restrict__ kx, double* __restrict__ ky, double rx, double ry)
{
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid >= x_inner * y_inner) return;

    const int x = x_inner + 2 * halo_depth - 1;
    const int col = gid % x_inner;
    const int row = gid / x_inner;
    const int off0 = halo_depth * (x + 1);
    const int index = off0 + col + row * x;

    double w_index = w[index]; // Cache repeated global memory access
    double w_index_1 = w[index - 1];
    double w_index_x = w[index - x];

    // Precompute reciprocal for reuse
    double rx_reciprocal = 1.0 / (2.0 * w_index * w_index_1);
    double ry_reciprocal = 1.0 / (2.0 * w_index * w_index_x);

    kx[index] = rx * (w_index_1 + w_index) * rx_reciprocal;
    ky[index] = ry * (w_index_x + w_index) * ry_reciprocal;
}