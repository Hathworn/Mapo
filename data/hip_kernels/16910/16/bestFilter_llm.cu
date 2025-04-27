#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void bestFilter(const double *Params, const float *data, const float *mu, float *err, float *eloss, int *ftype){
    // Use shared memory for frequently accessed variables
    __shared__ float shared_mu[NchanMax];
    
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NT = (int) Params[0];
    int Nfilt = (int) Params[1];
    float lam = (float) Params[7];
    int nt0 = (int) Params[4];
    
    if (tid < NchanMax) {
        shared_mu[tid] = mu[tid];
    }
    __syncthreads();

    int tid0 = tid + bid * blockDim.x;
    while (tid0 < NT - nt0) {
        float Cbest = 0.0f;
        float Cnextbest = 0.0f;
        int ibest = 0;

        #pragma unroll  // Unroll loop for efficiency
        for (int i = 0; i < Nfilt; i++) {
            float a = 1 + lam;
            float b = fmaxf(0.0f, data[tid0 + NT * i]) + lam * shared_mu[i];
            float Cf = b * b / a - lam * shared_mu[i] * shared_mu[i];

            if (Cf > Cbest + 1e-6f) {
                Cnextbest = Cbest;
                Cbest = Cf;
                ibest = i;
            }
            else if (Cf > Cnextbest + 1e-6f) {
                Cnextbest = Cf;
            }
        }
        err[tid0] = Cbest;
        eloss[tid0] = Cbest - Cnextbest;
        ftype[tid0] = ibest;

        tid0 += blockDim.x * gridDim.x;
    }
}