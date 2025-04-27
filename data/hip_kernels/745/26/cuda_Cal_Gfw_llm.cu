#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_Cal_Gfw(float *GfW, float2 *Grf, float2 *Gcf, int nRows, int nCols) {
    unsigned int Tidx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int Tidy = threadIdx.y + blockIdx.y * blockDim.y;

    // Consolidate operations for improved efficiency
    if (Tidx < nCols && Tidy < nRows) {
        unsigned int index = Tidx + Tidy * nCols;
        float2 Grf_temp = Grf[index];
        float2 Gcf_temp = Gcf[index];
        
        // Optimize computation by combining operations
        float GfW_temp = (Grf_temp.x * Grf_temp.x + Grf_temp.y * Grf_temp.y) +
                         (Gcf_temp.x * Gcf_temp.x + Gcf_temp.y * Gcf_temp.y);

        GfW[index] = GfW_temp;
    }
}