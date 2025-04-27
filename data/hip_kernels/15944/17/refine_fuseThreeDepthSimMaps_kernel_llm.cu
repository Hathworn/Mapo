#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_fuseThreeDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float* isimLst, int isimLst_p, float* idptLst, int idptLst_p, float* isimAct, int isimAct_p, float* idptAct, int idptAct_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if ((x < width) && (y < height)) {
        float dpts[3];
        float sims[3];

        // Load memory directly to registers
        dpts[0] = odpt[y * odpt_p + x];
        dpts[1] = idptLst[y * idptLst_p + x];
        dpts[2] = idptAct[y * idptAct_p + x];

        sims[0] = osim[y * osim_p + x];
        sims[1] = isimLst[y * isimLst_p + x];
        sims[2] = isimAct[y * isimAct_p + x];

        // Simplify calculations using a single pass
        float outDpt = dpts[0];
        float outSim = sims[0];

        if (sims[1] < outSim) {
            outDpt = dpts[1];
            outSim = sims[1];
        }
        
        if (sims[2] < outSim) {
            outDpt = dpts[2];
            outSim = sims[2];
        }

        osim[y * osim_p + x] = outSim;
        odpt[y * odpt_p + x] = outDpt;
    }
}