#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ppcg_calc_ur(const int x_inner, const int y_inner, const int halo_depth, const double* kx, const double* ky, const double* sd, double* u, double* r)
{
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit early if gid is out of boundary
    if (gid < x_inner * y_inner) {
        const int x = x_inner + 2 * halo_depth;
        const int col = gid % x_inner;
        const int row = gid / x_inner;
        const int off0 = halo_depth * (x + 1);
        const int index = off0 + col + row * x;

        // Calculate smvp using reduced mathematical operations
        const double smvp = (1.0 + kx[index+1] + kx[index] + ky[index+x] + ky[index]) * sd[index]
                            - (kx[index+1] * sd[index+1] + kx[index] * sd[index-1])
                            - (ky[index+x] * sd[index+x] + ky[index] * sd[index-x]);

        // Update r and u using optimized memory access
        r[index] -= smvp;
        u[index] += sd[index];
    }
}