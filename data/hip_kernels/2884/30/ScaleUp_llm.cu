#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ScaleUp(float *d_Result, float *d_Data, int width, int pitch, int height, int newpitch)
{
    // Use variables directly to minimize repeated calculations
    const int tx = threadIdx.x;
    const int ty = threadIdx.y;
    const int x = blockIdx.x * SCALEUP_W + 2 * tx;
    const int y = blockIdx.y * SCALEUP_H + 2 * ty;

    // Check bounds once for entire work under this thread
    if (x < 2 * width && y < 2 * height) {
        const int xl = blockIdx.x * (SCALEUP_W / 2) + tx;
        const int yu = blockIdx.y * (SCALEUP_H / 2) + ty;
        const int xr = min(xl + 1, width - 1);
        const int yd = min(yu + 1, height - 1);

        // Load data once to reduce global memory accesses
        const float vul = d_Data[yu * pitch + xl];
        const float vur = d_Data[yu * pitch + xr];
        const float vdl = d_Data[yd * pitch + xl];
        const float vdr = d_Data[yd * pitch + xr];

        // Calculate and store results directly
        const int index1 = y * newpitch + x;
        const int index2 = (y + 1) * newpitch + x;

        d_Result[index1 + 0] = vul;
        d_Result[index1 + 1] = 0.50f * (vul + vur);
        d_Result[index2 + 0] = 0.50f * (vul + vdl);
        d_Result[index2 + 1] = 0.25f * (vul + vur + vdl + vdr);
    }
}