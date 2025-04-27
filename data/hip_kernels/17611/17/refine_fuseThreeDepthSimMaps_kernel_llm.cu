#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_fuseThreeDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float* isimLst, int isimLst_p, float* idptLst, int idptLst_p, float* isimAct, int isimAct_p, float* idptAct, int idptAct_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds for the current thread
    if (x >= width || y >= height) return;

    float dpts[3] = { odpt[y * odpt_p + x], idptLst[y * idptLst_p + x], idptAct[y * idptAct_p + x] };
    float sims[3] = { osim[y * odpt_p + x], isimLst[y * isimLst_p + x], isimAct[y * isimAct_p + x] };

    float outDpt = dpts[0];
    float outSim = simThr;

    // Simplified with ternary operations
    for (int i = 1; i < 3; ++i) {
        if (sims[i] < outSim) {
            outSim = sims[i];
            outDpt = dpts[i];
        }
    }

    osim[y * osim_p + x] = outSim;
    odpt[y * odpt_p + x] = outDpt;
}