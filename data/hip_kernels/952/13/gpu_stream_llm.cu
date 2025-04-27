#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ size_t gpu_fieldn_index(unsigned int x, unsigned int y, unsigned int d)
{
    return (NX * (NY * (d - 1) + y) + x);
}

__global__ void gpu_stream(double *f0, double *f1, double *f2, double *h0, double *h1, double *h2)
{
    unsigned int y = blockIdx.y;
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Precompute indices to reduce redundant calculations
    unsigned int idx_xm1 = (NX + x - 1) % NX;
    unsigned int idx_xp1 = (x + 1) % NX;
    unsigned int idx_ym1 = (NY + y - 1) % NY;
    unsigned int idx_yp1 = (y + 1) % NY;

    size_t idx_base = gpu_fieldn_index(x, y, 0);

    // Use temporary variables to minimize repeated indexing and accesses
    double t_f1[8], t_h1[8], t_f2[8], t_h2[8];

    t_f2[0] = f2[idx_base + gpu_fieldn_index(idx_xm1, y, 1)];
    t_f2[1] = f2[idx_base + gpu_fieldn_index(x, idx_ym1, 2)];
    t_f2[2] = f2[idx_base + gpu_fieldn_index(idx_xp1, y, 3)];
    t_f2[3] = f2[idx_base + gpu_fieldn_index(x, idx_yp1, 4)];
    t_f2[4] = f2[idx_base + gpu_fieldn_index(idx_xm1, idx_ym1, 5)];
    t_f2[5] = f2[idx_base + gpu_fieldn_index(idx_xp1, idx_ym1, 6)];
    t_f2[6] = f2[idx_base + gpu_fieldn_index(idx_xp1, idx_yp1, 7)];
    t_f2[7] = f2[idx_base + gpu_fieldn_index(idx_xm1, idx_yp1, 8)];

    t_h2[0] = h2[idx_base + gpu_fieldn_index(idx_xm1, y, 1)];
    t_h2[1] = h2[idx_base + gpu_fieldn_index(x, idx_ym1, 2)];
    t_h2[2] = h2[idx_base + gpu_fieldn_index(idx_xp1, y, 3)];
    t_h2[3] = h2[idx_base + gpu_fieldn_index(x, idx_yp1, 4)];
    t_h2[4] = h2[idx_base + gpu_fieldn_index(idx_xm1, idx_ym1, 5)];
    t_h2[5] = h2[idx_base + gpu_fieldn_index(idx_xp1, idx_ym1, 6)];
    t_h2[6] = h2[idx_base + gpu_fieldn_index(idx_xp1, idx_yp1, 7)];
    t_h2[7] = h2[idx_base + gpu_fieldn_index(idx_xm1, idx_yp1, 8)];

    // Write from temporary variables to output arrays to improve locality
    for (int i = 0; i < 8; i++)
    {
        f1[idx_base + gpu_fieldn_index(x, y, i + 1)] = t_f2[i];
        h1[idx_base + gpu_fieldn_index(x, y, i + 1)] = t_h2[i];
    }
}