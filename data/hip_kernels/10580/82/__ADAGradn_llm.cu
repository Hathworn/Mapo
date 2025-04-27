#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __ADAGradn(int nrows, int ncols, float *mm, float *um, float *ssq, float *momentum, float mu, float *mask, int maskr, float nw, float *ve, int nve, float *ts, int nts, float *lr, int nlr, float langevin, float eps, int doupdate, hiprandState *rstates) {
    int ithread = threadIdx.x + blockDim.x * (blockIdx.x + gridDim.x * blockIdx.y);
    int nthreads = blockDim.x * gridDim.x * gridDim.y;

    float sqrtnw = sqrtf(nw);
    float sqrt1mnw = sqrtf(1-nw);
    float sqrteps = sqrt(eps);
    hiprandState *prstate = &rstates[ithread];

    for (int i = ithread; i < nrows * ncols; i += nthreads) {
        int icol = i / nrows;
        int irow = i - icol * nrows;
        
        // Use shared memory for frequently accessed data
        __shared__ float shared_ve, shared_ts, shared_lr;

        if (threadIdx.x == 0) {
            shared_ve = (nve > 1) ? ve[irow] : ve[0];
            shared_ts = (nts > 1) ? ts[irow] : ts[0];
            shared_lr = (nlr > 1) ? lr[irow] : lr[0];
        }
        __syncthreads();

        float umval = um[i];
        float sqrtss = ssq[i];
        
        float sqrtnewss = hypotf(sqrtnw * umval, sqrt1mnw * sqrtss);
        ssq[i] = sqrtnewss;
        
        if (doupdate) {
            float mmval = mm[i];
            sqrtnewss = hypotf(sqrtnewss, sqrteps);
            float denom = (shared_ve == 0.5f) ? sqrtnewss : powf(sqrtnewss, shared_ve * 2);

            float grad = umval / denom;
            if (langevin > 0) grad += hiprand_normal(prstate) * langevin;
            grad *= shared_lr * shared_ts;                 // Normal gradient

            float oldmom = momentum[i];                     // Momentum
            float newmom = grad + mu * oldmom;              // Compute new momentum
            momentum[i] = newmom;                           // Save new momentum
            
            mmval += newmom + mu * (newmom - oldmom);       // Update mmval
            
            if (maskr > 0) {
                if (maskr > 1) {
                    mmval *= mask[i];
                } else {
                    mmval *= mask[icol];
                }
            }
            mm[i] = mmval;
        }
    }
}