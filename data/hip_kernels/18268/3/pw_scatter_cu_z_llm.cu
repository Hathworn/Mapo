#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    const int igpt = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x; // Calculate global thread index

    if (igpt < ngpts) {
        int idx = 2 * igpt; // Precompute index
        int mapIdx = 2 * ghatmap[igpt]; // Precompute map index

        // Perform scattering operation
        double valueReal = scale * pwcc[idx];
        double valueImag = scale * pwcc[idx + 1];

        c[mapIdx] = valueReal;
        c[mapIdx + 1] = valueImag;

        // Check and process for nmaps
        if (nmaps == 2) {
            int mapIdx2 = 2 * ghatmap[igpt + ngpts];
            c[mapIdx2] = valueReal;
            c[mapIdx2 + 1] = -valueImag;
        }
    }
}