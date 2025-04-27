#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void jacobi_init(const int x_inner, const int y_inner, const int halo_depth, const double* density, const double* energy, const double rx, const double ry, double* kx, double* ky, double* u0, double* u, const int coefficient)
{
    // Compute global thread ID
    const int gid = threadIdx.x + blockIdx.x * blockDim.x;
    if (gid >= x_inner * y_inner) return;

    const int x = x_inner + 2 * halo_depth;
    const int col = gid % x_inner;
    const int row = gid / x_inner;
    const int off0 = halo_depth * (x + 1);
    const int index = off0 + col + row * x;

    // Precompute index-based accessed variables
    const double density_value = density[index];
    const double energy_value = energy[index];
    const double u_temp = energy_value * density_value;
    
    u0[index] = u_temp;
    u[index] = u_temp;

    // Early exit for halo region
    if (row == 0 || col == 0) return;

    // Variables to hold density values
    double density_center, density_left, density_down;

    // Precompute density values based on coefficient
    if (coefficient == CONDUCTIVITY) {
        density_center = density_value;
        density_left = density[index - 1];
        density_down = density[index - x];
    } else if (coefficient == RECIP_CONDUCTIVITY) {
        density_center = 1.0 / density_value;
        density_left = 1.0 / density[index - 1];
        density_down = 1.0 / density[index - x];
    }

    // Compute kx and ky
    const double density_left_center = density_left * density_center;
    const double density_down_center = density_down * density_center;
    kx[index] = rx * (density_left + density_center) / (2.0 * density_left_center);
    ky[index] = ry * (density_down + density_center) / (2.0 * density_down_center);
}