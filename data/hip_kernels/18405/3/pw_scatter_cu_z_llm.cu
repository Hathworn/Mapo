#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    // Use variables to avoid redundant calculations
    int igpt = (blockIdx.y * gridDim.x + blockIdx.x) * blockDim.x + threadIdx.x;

    if (igpt < ngpts) {
        int index = 2 * igpt;
        int mapIndex = 2 * ghatmap[igpt];

        // Combined loading, scaling, and writing to optimize memory operations
        double scaledReal = scale * pwcc[index];
        double scaledImag = scale * pwcc[index + 1];

        c[mapIndex] = scaledReal;
        c[mapIndex + 1] = scaledImag;

        if (nmaps == 2) {
            int mapIndex_nmaps2 = 2 * ghatmap[igpt + ngpts];
            c[mapIndex_nmaps2] = scaledReal;
            c[mapIndex_nmaps2 + 1] = -scaledImag; // Remove unneeded multiplication
        }
    }
}