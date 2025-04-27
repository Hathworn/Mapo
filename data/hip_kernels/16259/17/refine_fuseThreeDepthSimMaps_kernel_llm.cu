#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void refine_fuseThreeDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float* isimLst, int isimLst_p, float* idptLst, int idptLst_p, float* isimAct, int isimAct_p, float* idptAct, int idptAct_p, int width, int height, float simThr)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if ((x < width) && (y < height))
    {
        // Load data from global to registers
        float dpt0 = odpt[y * odpt_p + x];
        float dpt1 = idptLst[y * idptLst_p + x];
        float dpt2 = idptAct[y * idptAct_p + x];

        float sim0 = osim[y * osim_p + x];
        float sim1 = isimLst[y * isimLst_p + x];
        float sim2 = isimAct[y * isimAct_p + x];

        // Reduce branch divergence by using select statements
        float outDpt = (sim1 < sim0 ? dpt1 : dpt0);
        float outSim = (sim1 < sim0 ? sim1 : sim0);
        outDpt = (sim2 < outSim ? dpt2 : outDpt);
        outSim = (sim2 < outSim ? sim2 : outSim);

        // Write results back to global memory
        osim[y * osim_p + x] = outSim;
        odpt[y * odpt_p + x] = outDpt;
    }
}