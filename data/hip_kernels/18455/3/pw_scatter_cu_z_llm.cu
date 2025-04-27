#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {
    // Determine global thread ID
    const int igpt = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Check if thread index is within bounds
    if (igpt < ngpts) {
        const int map_idx = ghatmap[igpt];
        const double pwcc_val_real = scale * pwcc[2 * igpt];
        const double pwcc_val_imag = scale * pwcc[2 * igpt + 1];

        // Map scaled real and imaginary parts
        c[2 * map_idx] = pwcc_val_real;
        c[2 * map_idx + 1] = pwcc_val_imag;

        if (nmaps == 2) {
            const int map_idx_ngpts = ghatmap[igpt + ngpts];
            // Map additional scaled real and negated imaginary parts
            c[2 * map_idx_ngpts] = pwcc_val_real;
            c[2 * map_idx_ngpts + 1] = -pwcc_val_imag;
        }
    }
}