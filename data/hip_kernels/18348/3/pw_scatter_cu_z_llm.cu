#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {

    // Calculate global thread index
    int igpt = blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y) + threadIdx.x;

    if (igpt < ngpts) {
        int index = 2 * igpt;
        int mapIdx = ghatmap[igpt];
        
        // Store scaled values
        double scaledReal = scale * pwcc[index];
        double scaledImag = scale * pwcc[index + 1];
        
        // Map and write the scaled values
        c[2 * mapIdx] = scaledReal;
        c[2 * mapIdx + 1] = scaledImag;

        // Handle nmaps == 2 case without recalculations
        if (nmaps == 2) {
            int mapIdxOffset = ghatmap[igpt + ngpts];
            c[2 * mapIdxOffset] = scaledReal;
            c[2 * mapIdxOffset + 1] = -scaledImag;
        }
    }
}