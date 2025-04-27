#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BuildColorFieldDev(float* data, uchar4* colors, float* minmax, uint xx, uint yy) 
{
    float mn = minmax[0];
    float mx = minmax[1];
    float median = (mx - mn) * 0.5f;

    // Calculate a unique global index for the current thread
    const uint idx = blockIdx.x * blockDim.x + threadIdx.x; 

    float val = data[idx];
    uchar4 col;

#if 1
    // Use ternary operators for simplification
    float alpha = (val < median) ? (val - mn) / (median - mn) : (val - median) / (mx - median);
    
    col.x = (val < median) ? 0 : 255 * alpha;
    col.y = (val < median) ? 255 * (1 - alpha) : 0;
    col.z = (val < median) ? 255 * alpha : 255 * (1 - alpha);
#else
    float alpha = 1;

    if (!(val < 0.1 || mn == mx || mx < 0.1))
        alpha = val / (mx - mn);

    col.x = col.y = col.z = 255 * (1 - alpha);
#endif
    col.w = 255;

    // Update the global memory for color based on unique color index
    const uint col_idx = blockIdx.x * blockDim.x + threadIdx.x;
    colors[col_idx] = col;
}