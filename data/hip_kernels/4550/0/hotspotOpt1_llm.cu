#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hotspotOpt1(float *p, float* tIn, float *tOut, float sdc, int nx, int ny, int nz, float ce, float cw, float cn, float cs, float ct, float cb, float cc)
{
    float amb_temp = 80.0;

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int j = blockDim.y * blockIdx.y + threadIdx.y;

    // Pre-compute repeated multiplications to reduce computation inside the loop
    int xy = nx * ny;
    int ij = i + j * nx;

    // Check if thread is within the valid range to avoid out-of-bound access
    if (i >= nx || j >= ny) return;

    // Performance measurement loop
    for(int run = 0; run < 100; run++){
        int c = ij;
        int W = (i == 0) ? c : c - 1;
        int E = (i == nx - 1) ? c : c + 1;
        int N = (j == 0) ? c : c - nx;
        int S = (j == ny - 1) ? c : c + nx;

        // Load values into registers to minimize global memory accesses
        float temp1, temp2, temp3;
        temp1 = temp2 = tIn[c];
        temp3 = tIn[c + xy];
        tOut[c] = cc * temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
                + cn * tIn[N] + cb * temp1 + ct * temp3 + sdc * p[c] + ct * amb_temp;
        
        c += xy;
        W += xy;
        E += xy;
        N += xy;
        S += xy;

        // Main loop for layer processing
        #pragma unroll
        for (int k = 1; k < nz - 1; ++k) {
            temp1 = temp2;
            temp2 = temp3;
            temp3 = tIn[c + xy];
            tOut[c] = cc * temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
                    + cn * tIn[N] + cb * temp1 + ct * temp3 + sdc * p[c] + ct * amb_temp;
            
            c += xy;
            W += xy;
            E += xy;
            N += xy;
            S += xy;
        }

        // Handle the last k iteration
        temp1 = temp2;
        temp2 = temp3;
        tOut[c] = cc * temp2 + cw * tIn[W] + ce * tIn[E] + cs * tIn[S]
                + cn * tIn[N] + cb * temp1 + ct * temp3 + sdc * p[c] + ct * amb_temp;
    }
    return;
}