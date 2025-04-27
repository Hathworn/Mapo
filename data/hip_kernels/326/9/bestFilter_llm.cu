#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bestFilter(const double *Params, const float *data, const float *mu, const float *lam, const float *nu, float *xbest, float *err, int *ftype) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NT = (int) Params[0];
    int Nfilt = (int) Params[1];
    float Th = (float) Params[2];
    float epu = (float) Params[8];

    int tid0 = tid + bid * blockDim.x; // Use blockDim.x instead of Nthreads
    if (tid0 < NT - 1 && tid0 > 0) { // Use logical AND (&&) for better clarity
        float Cbest = 0.0f, xb = 0.0f;
        int ibest = 0;
        
        for (int i = 0; i < Nfilt; i++) {
            float Ci = data[tid0 + NT * i] + mu[i] * lam[i];
            float Cf = Ci * Ci / (lam[i] + 1.0f) - lam[i] * mu[i] * mu[i];
            
            // Add the shift component
            float cdiff = data[tid0 + 1 + NT * i] - data[tid0 - 1 + NT * i];
            Cf += cdiff * cdiff / (epu + nu[i]);
            
            if (Cf > Cbest) {
                Cbest = Cf;
                xb = Ci - mu[i] * lam[i]; // Simplify the division
                ibest = i;
            }
        }
        
        if (Cbest > Th * Th) {
            err[tid0] = Cbest;
            xbest[tid0] = xb;
            ftype[tid0] = ibest;
        }
    }
}