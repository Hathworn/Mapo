#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelF(const float *d_xAx, const float *d_bx, const float *d_c, float *d_y)
{
    // Simplified calculation using shared variables; assuming operation on single element arrays
    float xAx = *d_xAx;  // Cache the value of d_xAx
    float bx = *d_bx;    // Cache the value of d_bx
    float c = *d_c;      // Cache the value of d_c
    
    *d_y = xAx + bx + c; // Perform the addition with cached values
}