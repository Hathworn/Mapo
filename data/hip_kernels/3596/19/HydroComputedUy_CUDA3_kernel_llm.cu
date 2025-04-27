#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void HydroComputedUy_CUDA3_kernel(float *FluxD, float *FluxS1, float *FluxS2, float *FluxS3, float *FluxTau, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float dtdx, int size, int dim0, int dim1, int dim2)
{
    // Calculate linear index
    const long tx = threadIdx.x;
    const long bx = blockIdx.x;
    const long by = blockIdx.y;
    int igridy = tx + bx * CUDA_BLOCK_SIZE + by * CUDA_BLOCK_SIZE * CUDA_GRID_SIZE;

    if (igridy < 2 || igridy > size - 3) return;

    // Calculate i, j, k from igridy
    int k = igridy / (dim0 * dim1);
    int rem = igridy - k * (dim0 * dim1);
    int i = rem / dim1;
    int j = rem % dim1;

    int igrid = i + (j + k * dim1) * dim0;

    // Reduce redundant calculation by reusing variables
    int igridyp1 = igridy + 1;
    k = igridyp1 / (dim0 * dim1);
    rem = igridyp1 - k * (dim0 * dim1);
    i = rem / dim1;
    j = rem % dim1;
    int igridp1 = i + (j + k * dim1) * dim0;

    // Update dU arrays using shared expressions
    float diffD = (FluxD[igrid] - FluxD[igridp1]) * dtdx;
    float diffS1 = (FluxS1[igrid] - FluxS1[igridp1]) * dtdx;
    float diffS2 = (FluxS2[igrid] - FluxS2[igridp1]) * dtdx;
    float diffS3 = (FluxS3[igrid] - FluxS3[igridp1]) * dtdx;
    float diffTau = (FluxTau[igrid] - FluxTau[igridp1]) * dtdx;

    dUD[igrid] += diffD;
    dUS1[igrid] += diffS1;
    dUS2[igrid] += diffS2;
    dUS3[igrid] += diffS3;
    dUTau[igrid] += diffTau;
}