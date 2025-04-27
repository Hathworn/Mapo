#include "hip/hip_runtime.h"
#include "includes.h"
#define min(X,Y) ((X) < (Y) ? (X) : (Y))

__global__ void accel_update(int nx, int ny, double dx2inv, double dy2inv, double* d_z, double* d_a) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Calculate row and column indices
    int r = i / nx;
    int c = i % nx;

    if (i < nx * ny) {
        // Check bounds within the grid
        if (r > 0 && r < ny - 1 && c > 0 && c < nx - 1) {
            // Precompute reused array accesses
            double current_z = d_z[i];
            double ax = (d_z[i + nx] + d_z[i - nx] - 2.0 * current_z) * dx2inv;
            double ay = (d_z[i + 1] + d_z[i - 1] - 2.0 * current_z) * dy2inv;
            d_a[i] = 0.5 * (ax + ay); // Optimize division by 2
        } else {
            d_a[i] = 0.0;
        }
    }
}