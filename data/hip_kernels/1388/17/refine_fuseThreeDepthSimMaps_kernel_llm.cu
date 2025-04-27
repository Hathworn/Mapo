```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_fuseThreeDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float* isimLst, int isimLst_p, float* idptLst, int idptLst_p, float* isimAct, int isimAct_p, float* idptAct, int idptAct_p, int width, int height, float simThr)
{
    // Calculate coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if((x < width) && (y < height))
    {
        // Utilize shared memory for faster access
        __shared__ float sharedDpts[3];
        __shared__ float sharedSims[3];

        sharedDpts[0] = odpt[y * odpt_p + x];
        sharedDpts[1] = idptLst[y * idptLst_p + x];
        sharedDpts[2] = idptAct[y * idptAct_p + x];

        sharedSims[0] = osim[y * osim_p + x];
        sharedSims[1] = isimLst[y * isimLst_p + x];
        sharedSims[2] = isimAct[y * isimAct_p + x];

        float outDpt = sharedDpts[0];
        float outSim = simThr;

        // Simplified conditional assignments using ternary operations
        outDpt = ((sharedSims[1] < outSim) ? sharedDpts[1] : outDpt);
        outSim = ((sharedSims[1] < outSim) ? sharedSims[1] : outSim);
        outDpt = ((sharedSims[2] < outSim) ? sharedDpts[2] : outDpt);
        outSim = ((sharedSims[2] < outSim) ? sharedSims[2] : outSim);

        // Write back results
        osim[y * osim_p + x] = outSim;
        odpt[y * odpt_p + x] = outDpt;
    }
}