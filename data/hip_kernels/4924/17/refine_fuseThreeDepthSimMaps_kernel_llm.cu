```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void refine_fuseThreeDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float* isimLst, int isimLst_p, float* idptLst, int idptLst_p, float* isimAct, int isimAct_p, float* idptAct, int idptAct_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds before proceeding
    if(x >= width || y >= height)
        return;

    // Pre-calculate indexes
    int idx_odpt = y * odpt_p + x;
    int idx_idptLst = y * idptLst_p + x;
    int idx_idptAct = y * idptAct_p + x;
    int idx_osim = y * osim_p + x;
    int idx_isimLst = y * isimLst_p + x;
    int idx_isimAct = y * isimAct_p + x;

    float dpts[3] = {odpt[idx_odpt], idptLst[idx_idptLst], idptAct[idx_idptAct]};
    float sims[3] = {osim[idx_osim], isimLst[idx_isimLst], isimAct[idx_isimAct]};

    float outDpt = dpts[0];
    float outSim = simThr;

    // Use conditional assignment for efficiency
    if (sims[1] < outSim) {
        outDpt = dpts[1];
        outSim = sims[1];
    }
    if (sims[2] < outSim) {
        outDpt = dpts[2];
        outSim = sims[2];
    }

    osim[idx_osim] = outSim;
    odpt[idx_odpt] = outDpt;
}
```
