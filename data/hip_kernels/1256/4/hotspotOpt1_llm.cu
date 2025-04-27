#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void hotspotOpt1(float *p, float* tIn, float *tOut, float sdc, int nx, int ny, int nz, float ce, float cw, float cn, float cs, float ct, float cb, float cc)
{
    float amb_temp = 80.0;

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;

    if (i >= nx || j >= ny) return; // Early exit for out-of-bound threads

    int c = i + j * nx;
    int xy = nx * ny;

    int W = max(0, i - 1) + j * nx;         // Avoid condition check using max
    int E = min(nx - 1, i + 1) + j * nx;    // Avoid condition check using min
    int N = i + max(0, j - 1) * nx;         // Avoid condition check using max
    int S = i + min(ny - 1, j + 1) * nx;    // Avoid condition check using min

    float temp1, temp2, temp3;
    temp1 = temp2 = tIn[c];
    temp3 = tIn[c+xy];
    tOut[c] = cc * temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
              + cn * tIn[N] + cb * temp1 + ct * temp3 + sdc * p[c] + ct * amb_temp;
    c += xy;
    W += xy;
    E += xy;
    N += xy;
    S += xy;

    for (int k = 1; k < nz-1; ++k) {
        temp1 = temp2;
        temp2 = temp3;
        temp3 = tIn[c+xy];
        tOut[c] = cc * temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
                  + cn * tIn[N] + cb * temp1 + ct * temp3 + sdc * p[c] + ct * amb_temp;
        c += xy;
        W += xy;
        E += xy;
        N += xy;
        S += xy;
    }
    temp1 = temp2;
    temp2 = temp3;
    tOut[c] = cc * temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
              + cn * tIn[N] + cb * temp1 + ct * temp3 + sdc * p[c] + ct * amb_temp;
}