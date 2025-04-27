#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cheby_calc_u(const int x_inner, const int y_inner, const int halo_depth, const double* p, double* u)
{
    // Calculate global thread index
    int gid = blockIdx.x * blockDim.x + threadIdx.x;
    if (gid >= x_inner * y_inner) return;

    // Calculate global memory index
    int x = x_inner + 2 * halo_depth;
    int col = gid % x_inner;
    int row = gid / x_inner;
    int index = halo_depth * (x + 1) + col + row * x;

    // Update u array
    u[index] += p[index];
}