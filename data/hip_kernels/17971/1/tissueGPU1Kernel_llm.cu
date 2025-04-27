#include "hip/hip_runtime.h"
#include "includes.h"

/***********************************************************
tissueGPU1.cu
GPU kernel to accumulate contributions of tissue source
strengths qt to tissue solute levels pt.
TWS December 2011
Cuda 10.1 Version, August 2019
************************************************************/

__global__ void tissueGPU1Kernel(int *d_tisspoints, float *d_dtt000, float *d_pt000, float *d_qt000, int nnt)
{
    int itp = blockDim.x * blockIdx.x + threadIdx.x;
    int nnt2 = 2 * nnt;
    float p = 0.0f;

    if (itp < nnt) {
        int ix = d_tisspoints[itp];
        int iy = d_tisspoints[itp + nnt];
        int iz = d_tisspoints[itp + nnt2];

        // Use shared memory to optimize access to d_tisspoints
        __shared__ int s_tisspoints[1024]; // assuming a max block size, tune appropriately

        // Load shared memory
        if (threadIdx.x < nnt) {
            s_tisspoints[threadIdx.x] = d_tisspoints[threadIdx.x];
            s_tisspoints[threadIdx.x + nnt] = d_tisspoints[threadIdx.x + nnt];
            s_tisspoints[threadIdx.x + nnt2] = d_tisspoints[threadIdx.x + nnt2];
        }
        __syncthreads();

        for (int jtp = 0; jtp < nnt; jtp++) {
            // Access shared memory instead of global memory
            int jx = s_tisspoints[jtp];
            int jy = s_tisspoints[jtp + nnt];
            int jz = s_tisspoints[jtp + nnt2];
            int ixyz = abs(jx - ix) + abs(jy - iy) + abs(jz - iz);
            p += d_qt000[jtp] * d_dtt000[ixyz];
        }
        d_pt000[itp] = p;
    }
}