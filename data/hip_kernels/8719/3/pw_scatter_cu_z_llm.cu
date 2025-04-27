#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {
    // Calculate global thread index more efficiently using built-in variable
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Use a simpler check structure to enhance readability
    if (igpt >= ngpts) return;

    // Reduced array lookups and operations in the main routine
    int mapIndex = ghatmap[igpt];
    int srcIndex = 2 * igpt;
    int destIndex = 2 * mapIndex;
    c[destIndex] = scale * pwcc[srcIndex];
    c[destIndex + 1] = scale * pwcc[srcIndex + 1];

    // Handle the nmaps == 2 case, optimizing similar patterns
    if (nmaps == 2) {
        mapIndex = ghatmap[igpt + ngpts];
        destIndex = 2 * mapIndex;
        c[destIndex] = scale * pwcc[srcIndex];
        c[destIndex + 1] = -scale * pwcc[srcIndex + 1];
    }
}