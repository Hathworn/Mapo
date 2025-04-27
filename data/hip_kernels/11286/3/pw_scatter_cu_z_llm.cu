#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    // Calculate global thread index for enhanced readability
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * blockIdx.y * gridDim.x;

    // Ensure thread is within bounds
    if (igpt < ngpts) {
        // Vectorized access for better memory coalescing
        int index1 = 2 * igpt;
        int index2 = 2 * ghatmap[igpt];

        // Write scaled values into output arrays
        c[index2] = scale * pwcc[index1];
        c[index2 + 1] = scale * pwcc[index1 + 1];

        // Additional mapping if nmaps is 2
        if (nmaps == 2) {
            int index3 = 2 * ghatmap[igpt + ngpts];
            c[index3] = scale * pwcc[index1];
            c[index3 + 1] = -scale * pwcc[index1 + 1];
        }
    }
}