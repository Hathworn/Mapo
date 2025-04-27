#include "hip/hip_runtime.h"
#include "includes.h"
#define min(X,Y) ((X) < (Y) ? (X) : (Y))

__global__ void pos_update(int nx, int ny, double dt, double* d_z, double* d_v, double* d_a) {
    // Calculate the global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Bound check for valid threads within matrix boundaries
    if (i < nx * ny) {
        int r = i / nx;
        int c = i % nx;
        
        // Perform computations only if within valid range
        if (r < ny - 1 && r > 0 && c < nx - 1 && c > 0) {
            double v = d_v[i];   // Cache data in registers
            double a = d_a[i];   // Cache data in registers
            v = v + dt * a;
            d_v[i] = v;
            d_z[i] = d_z[i] + dt * v;
        }
    }
}