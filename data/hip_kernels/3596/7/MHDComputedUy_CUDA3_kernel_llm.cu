#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MHDComputedUy_CUDA3_kernel(float *FluxD, float *FluxS1, float *FluxS2, float *FluxS3, float *FluxTau, float *FluxBx, float *FluxBy, float *FluxBz, float *FluxPhi, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float *dUBx, float *dUBy, float *dUBz, float *dUPhi, float dtdx, int size, int dim0, int dim1, int dim2)
{
    // Get flattened global thread ID
    const int igridy = threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * blockDim.x * gridDim.x;

    // Thread boundary check
    if (igridy < 2 || igridy > size - 3)
        return;

    // Compute grid indices using less operations
    int temp = igridy;
    const int k = temp / (dim0 * dim1);
    temp -= k * dim0 * dim1;
    const int i = temp / dim1;
    const int j = temp % dim1;
    const int igrid = i + (j + k * dim1) * dim0;

    const int igridyp1 = igridy + 1;
    temp = igridyp1;
    const int kp1 = temp / (dim0 * dim1);
    temp -= kp1 * dim0 * dim1;
    const int ip1 = temp / dim1;
    const int jp1 = temp % dim1;
    const int igridp1 = ip1 + (jp1 + kp1 * dim1) * dim0;

    // Update dU vectors in a loop to reduce redundancy
    float *fluxArr[9] = {FluxD, FluxS1, FluxS2, FluxS3, FluxTau, FluxBx, FluxBy, FluxBz, FluxPhi};
    float *dUArr[9] = {dUD, dUS1, dUS2, dUS3, dUTau, dUBx, dUBy, dUBz, dUPhi};

    for (int idx = 0; idx < 9; ++idx) {
        dUArr[idx][igrid] += (fluxArr[idx][igrid] - fluxArr[idx][igridp1]) * dtdx;
    }
}