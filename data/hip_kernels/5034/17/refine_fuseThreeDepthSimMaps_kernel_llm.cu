#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void refine_fuseThreeDepthSimMaps_kernel(float* osim, int osim_p, float* odpt, int odpt_p, float* isimLst, int isimLst_p, float* idptLst, int idptLst_p, float* isimAct, int isimAct_p, float* idptAct, int idptAct_p, int width, int height, float simThr)
{
    // Calculate the global thread indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure indices are within bounds
    if((x < width) && (y < height))
    {
        // Declare local arrays to store depths and similarities
        float dpts[3];
        float sims[3];

        // Load data from global memory to local arrays
        dpts[0] = odpt[y * odpt_p + x];
        dpts[1] = idptLst[y * idptLst_p + x];
        dpts[2] = idptAct[y * idptAct_p + x];

        sims[0] = osim[y * osim_p + x];
        sims[1] = isimLst[y * isimLst_p + x];
        sims[2] = isimAct[y * isimAct_p + x];

        // Initialize output depth and similarity
        float outDpt = dpts[0];
        float outSim = simThr;

        // Replace manual comparisons with a loop for optimization
        #pragma unroll
        for (int i = 1; i < 3; ++i) 
        {
            if (sims[i] < outSim) 
            {
                outDpt = dpts[i];
                outSim = sims[i];
            }
        }

        // Write results back to global memory
        osim[y * osim_p + x] = outSim;
        odpt[y * odpt_p + x] = outDpt;
    }
}