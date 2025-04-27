#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hotspotOpt1(float *p, float* tIn, float *tOut, float sdc, int nx, int ny, int nz, float ce, float cw, float cn, float cs, float ct, float cb, float cc)
{
    float amb_temp = 80.0;

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;

    int c = i + j * nx;
    int xy = nx * ny;

    // Clamp boundary conditions to avoid conditional operator overhead
    int W = max(i - 1, 0) + j * nx;
    int E = min(i + 1, nx - 1) + j * nx;
    int N = i + max(j - 1, 0) * nx;
    int S = i + min(j + 1, ny - 1) * nx;

    float temp1, temp2, temp3;
    temp1 = temp2 = tIn[c];
    temp3 = tIn[c + xy];

    // Pre-compute terms outside the loop if possible
    float cc_temp2 = cc * temp2;
    float cb_temp1 = cb * temp1;
    float ct_amb_temp = ct * amb_temp;

    // Initial computation outside the loop
    tOut[c] = cc_temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
              + cn * tIn[N] + cb_temp1 + ct * temp3 + sdc * p[c] + ct_amb_temp;
    
    // Main loop
    c += xy;
    W += xy;
    E += xy;
    N += xy;
    S += xy;

    for (int k = 1; k < nz - 1; ++k) {
        temp1 = temp2;
        temp2 = temp3;
        temp3 = tIn[c + xy];

        cc_temp2 = cc * temp2; // Update pre-computed terms
        cb_temp1 = cb * temp1;

        tOut[c] = cc_temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
                  + cn * tIn[N] + cb_temp1 + ct * temp3 + sdc * p[c] + ct_amb_temp;
        
        c += xy;
        W += xy;
        E += xy;
        N += xy;
        S += xy;
    }
    
    // Final computation outside loop
    temp1 = temp2;
    temp2 = temp3;
    cc_temp2 = cc * temp2;
    cb_temp1 = cb * temp1;

    tOut[c] = cc_temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
              + cn * tIn[N] + cb_temp1 + ct * temp3 + sdc * p[c] + ct_amb_temp;
}