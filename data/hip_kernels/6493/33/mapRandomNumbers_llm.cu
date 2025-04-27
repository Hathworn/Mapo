#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mapRandomNumbers(const int nwl, const int ist, const int isb, const float *r, float *zr, int *kr, float *ru, int *kex) {
    // Calculate the global thread index
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int rr_base = isb * 4 * nwl + ist * 4 * 2 * nwl; // Precompute base offset for rr
    
    if (i < nwl) {
        int rr = i + rr_base;
        // Unroll loop iterations for better performance
        zr[i] = 1.0f / ACONST * powf(r[rr] * (ACONST - 1.0f) + 1.0f, 2.0f);
        rr += nwl;
        kr[i] = (int)truncf(r[rr] * (nwl - 0.000001f));
        rr += nwl;
        ru[i] = r[rr];
        rr += nwl;
        kex[i] = (int)truncf(r[rr] * 4.999999f); // Simplified constant
    }
}