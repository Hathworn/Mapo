#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MHDComputedUx_CUDA3_kernel(float *FluxD, float *FluxS1, float *FluxS2, float *FluxS3, float *FluxTau, float *FluxBx, float *FluxBy, float *FluxBz, float *FluxPhi, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float *dUBx, float *dUBy, float *dUBz, float *dUPhi, float dtdx, int size)
{
    // Calculate global grid index
    int igrid = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    // Boundary check
    if (igrid < 2 || igrid > size - 3)
        return;

    // Pre-calculate index
    int igridp1 = igrid + 1;

    // Use pointers for direct memory access to reduce overhead
    float diff_dtdx = dtdx;

    // Perform computations with reduced register pressure
    dUD[igrid] = (FluxD[igrid] - FluxD[igridp1]) * diff_dtdx;
    dUS1[igrid] = (FluxS1[igrid] - FluxS1[igridp1]) * diff_dtdx;
    dUS2[igrid] = (FluxS2[igrid] - FluxS2[igridp1]) * diff_dtdx;
    dUS3[igrid] = (FluxS3[igrid] - FluxS3[igridp1]) * diff_dtdx;
    dUTau[igrid] = (FluxTau[igrid] - FluxTau[igridp1]) * diff_dtdx;
    dUBx[igrid] = (FluxBx[igrid] - FluxBx[igridp1]) * diff_dtdx;
    dUBy[igrid] = (FluxBy[igrid] - FluxBy[igridp1]) * diff_dtdx;
    dUBz[igrid] = (FluxBz[igrid] - FluxBz[igridp1]) * diff_dtdx;
    dUPhi[igrid] = (FluxPhi[igrid] - FluxPhi[igridp1]) * diff_dtdx;
}