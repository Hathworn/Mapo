#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cg_calc_p(const int x_inner, const int y_inner, const int halo_depth, const double beta, const double* r, double* p)
{
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid >= x_inner * y_inner) return;

    const int x = x_inner + 2 * halo_depth;
  
    // Precompute offsets and indices
    const int row = gid / x_inner;
    const int col = gid % x_inner;
    const int index = (halo_depth + row) * x + (halo_depth + col);

    // Exploit registers for intermediate value storage
    const double r_value = r[index];
    const double p_value = p[index];

    p[index] = r_value + beta * p_value;
}