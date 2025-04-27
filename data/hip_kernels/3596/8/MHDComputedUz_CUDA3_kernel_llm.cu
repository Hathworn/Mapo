#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MHDComputedUz_CUDA3_kernel(float *FluxD, float *FluxS1, float *FluxS2, float *FluxS3, float *FluxTau, float *FluxBx, float *FluxBy, float *FluxBz, float *FluxPhi, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float *dUBx, float *dUBy, float *dUBz, float *dUPhi, float dtdx, int size, int dim0, int dim1, int dim2)
{
    // get thread and block index
    const long tx = threadIdx.x;
    const long bx = blockIdx.x;
    const long by = blockIdx.y;

    int igridz = tx + bx * CUDA_BLOCK_SIZE + by * CUDA_BLOCK_SIZE * CUDA_GRID_SIZE;

    // early exit for out-of-bound threads
    if (igridz < 2 || igridz > size - 3) return;

    int j = igridz / (dim0 * dim2);
    int i = (igridz - j * dim0 * dim2) / dim2;
    int k = igridz - j * dim0 * dim2 - i * dim2;
    int igrid = i + (j + k * dim1) * dim0;
    
    // compute position for the next point in the z-direction
    int igridzp1 = igridz + 1;
    int jp1 = igridzp1 / (dim0 * dim2);
    int ip1 = (igridzp1 - jp1 * dim0 * dim2) / dim2;
    int kp1 = igridzp1 - jp1 * dim0 * dim2 - ip1 * dim2;
    int igridp1 = ip1 + (jp1 + kp1 * dim1) * dim0;

    // use shared calculation results
    float dtdx_res = dtdx;
    float diffD = FluxD[igrid] - FluxD[igridp1];
    float diffS1 = FluxS1[igrid] - FluxS1[igridp1];
    float diffS2 = FluxS2[igrid] - FluxS2[igridp1];
    float diffS3 = FluxS3[igrid] - FluxS3[igridp1];
    float diffTau = FluxTau[igrid] - FluxTau[igridp1];
    float diffBx = FluxBx[igrid] - FluxBx[igridp1];
    float diffBy = FluxBy[igrid] - FluxBy[igridp1];
    float diffBz = FluxBz[igrid] - FluxBz[igridp1];
    float diffPhi = FluxPhi[igrid] - FluxPhi[igridp1];

    // update the arrays
    dUD[igrid] += diffD * dtdx_res;
    dUS1[igrid] += diffS1 * dtdx_res;
    dUS2[igrid] += diffS2 * dtdx_res;
    dUS3[igrid] += diffS3 * dtdx_res;
    dUTau[igrid] += diffTau * dtdx_res;
    dUBx[igrid] += diffBx * dtdx_res;
    dUBy[igrid] += diffBy * dtdx_res;
    dUBz[igrid] += diffBz * dtdx_res;
    dUPhi[igrid] += diffPhi * dtdx_res;
}