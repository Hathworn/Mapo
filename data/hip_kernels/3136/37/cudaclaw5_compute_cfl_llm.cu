#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaclaw5_compute_cfl(int idir, int mx, int my, int meqn, int mwaves, int mbc, double dx, double dy, double dt, double *speeds, double* cflgrid)
{
    // Calculate grid offset based on x/y direction
    int grid_offset = (idir == 1) ? my : mx;

    // Global thread index for accessing speed and cflgrid
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within grid bounds
    if (tid >= grid_offset)
        return;

    double max_cfl = 0.0;
    double dtdx = (idir == 1) ? dt / dx : dt / dy;

    // Optimize loop by processing waves for each thread
    for (int mw = 0; mw < mwaves; ++mw) {
        double s_pos = speeds[mw * grid_offset + tid];
        double s_neg = -s_pos; // Simplified assuming symmetric layout

        // Compare and keep track of maximum CFL
        if (s_pos > 0)
            max_cfl = max(max_cfl, dtdx * s_pos);
        else
            max_cfl = max(max_cfl, dtdx * s_neg);
    }
    
    // Write the maximum CFL value to the grid
    cflgrid[tid] = max_cfl;
}