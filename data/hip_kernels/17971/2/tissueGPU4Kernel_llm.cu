#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tissueGPU4Kernel(int *d_tisspoints, float *d_dtt000, float *d_qtp000, float *d_xt, float *d_rt, int nnt, int step, float diff)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int itp = i / step;
    int itp1 = i % step;
    int nnt2 = 2 * nnt;
    float r = 0.0f;

    if(itp < nnt){
        int ix = d_tisspoints[itp];
        int iy = d_tisspoints[itp + nnt];
        int iz = d_tisspoints[itp + nnt2];

        for(int jtp = itp1; jtp < nnt; jtp += step){
            int ixyz = abs(d_tisspoints[jtp] - ix) + abs(d_tisspoints[jtp + nnt] - iy) + abs(d_tisspoints[jtp + nnt2] - iz);
            r -= d_dtt000[ixyz] * d_qtp000[jtp] * d_xt[jtp];
        }

        r /= diff;
        r += d_xt[itp];  // diagonal of matrix has 1s

        if(itp1 == 0) d_rt[itp] = r;

        // Use a single loop with proper condition to ensure d_rt update
        for(int istep = 1; istep < step; istep++){
            __syncthreads();
            if(itp1 == istep) d_rt[itp] += r;
        }
    }
}