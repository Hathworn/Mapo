#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_scatter_cu_z(double *c, const double *pwcc, const double scale, const int ngpts, const int nmaps, const int *ghatmap) {
    // Calculate the global index
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igpt < ngpts) {
        int map_index = ghatmap[igpt];
        // Perform scaled value assignment to c array
        double scaled_real = scale * pwcc[2 * igpt];
        double scaled_imag = scale * pwcc[2 * igpt + 1];
        c[2 * map_index] = scaled_real;
        c[2 * map_index + 1] = scaled_imag;
        
        // Handle the case when nmaps is 2
        if (nmaps == 2) {
            int map_index_nmaps2 = ghatmap[igpt + ngpts];
            c[2 * map_index_nmaps2] = scaled_real;
            c[2 * map_index_nmaps2 + 1] = -scaled_imag;
        }
    }
}