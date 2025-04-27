#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_gather_cu_z(      double *pwcc, const double *c, const double  scale, const int     ngpts, const int    *ghatmap) {
    // Calculate unique thread index across all blocks
    const int igpt = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    if (igpt < ngpts) {
        int mappedIdx = ghatmap[igpt];
        // Directly access the mapped index to minimize memory indexing overhead
        pwcc[2 * igpt    ] = scale * c[2 * mappedIdx    ];
        pwcc[2 * igpt + 1] = scale * c[2 * mappedIdx + 1];
    }
}