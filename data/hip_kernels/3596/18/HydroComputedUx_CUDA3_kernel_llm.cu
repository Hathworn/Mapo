#include "hip/hip_runtime.h"
#include "includes.h"

#define CUDA_BLOCK_SIZE 256 // Assuming these constants are defined
#define CUDA_GRID_SIZE 256 

__global__ void HydroComputedUx_CUDA3_kernel(float *FluxD, float *FluxS1, float *FluxS2, float *FluxS3, float *FluxTau, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float dtdx, int size)
{
    // Get global thread index using built-in functions
    const long igrid = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Process only valid indices to avoid wasted computations
    if (igrid >= 2 && igrid <= size - 3) {
        int igridp1 = igrid + 1;

        // Efficient memory access by coalesced reads/writes
        dUD  [igrid] = (FluxD  [igrid] - FluxD  [igridp1]) * dtdx;
        dUS1 [igrid] = (FluxS1 [igrid] - FluxS1 [igridp1]) * dtdx;
        dUS2 [igrid] = (FluxS2 [igrid] - FluxS2 [igridp1]) * dtdx;
        dUS3 [igrid] = (FluxS3 [igrid] - FluxS3 [igridp1]) * dtdx;
        dUTau[igrid] = (FluxTau[igrid] - FluxTau[igridp1]) * dtdx;
    }
}