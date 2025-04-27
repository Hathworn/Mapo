#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {
    int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igpt < ngpts) {
        int index = 2 * ghatmap[igpt];
        c[index] = scale * pwcc[2 * igpt];
        c[index + 1] = scale * pwcc[2 * igpt + 1];
        if (nmaps == 2) {
            int index2 = 2 * ghatmap[igpt + ngpts];
            c[index2] = scale * pwcc[2 * igpt];
            c[index2 + 1] = -scale * pwcc[2 * igpt + 1];
        }
    }
}