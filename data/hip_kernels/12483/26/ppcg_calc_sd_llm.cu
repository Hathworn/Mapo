#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ppcg_calc_sd(const int x_inner, const int y_inner, const int halo_depth, const double alpha, const double beta, const double* r, double* sd)
{
    // Calculate global thread ID
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure thread operates within data boundaries. Avoid out-of-bounds memory access
    if (gid >= x_inner * y_inner) return;

    // Calculate index considering the halo region
    const int x = x_inner + 2 * halo_depth;
    const int col = gid % x_inner;
    const int row = gid / x_inner;
    const int off0 = halo_depth * (x + 1);
    const int index = off0 + col + row * x;

    // Update sd at calculated index using alpha and beta
    sd[index] = alpha * sd[index] + beta * r[index];
}