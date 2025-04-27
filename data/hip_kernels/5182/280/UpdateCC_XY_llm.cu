#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void UpdateCC_XY( float *CCXY, int id_CC, float *XY_tofill, int dim_XY ) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure id is within bounds before processing
    if (id < dim_XY) {
        CCXY[id_CC * dim_XY + id] = XY_tofill[id];
    }
}