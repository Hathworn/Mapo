#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void extractFEAT(const double *Params, const int *st, const int *id, const int *counter, const float *dout, const int *iList, const float *mu, float *d_feat) {
    int tidx = threadIdx.x;
    int tidy = threadIdx.y;
    int bid = blockIdx.x;

    int NT = (int)Params[0];
    int Nnearest = (int)Params[5];
    int NthreadsX = blockDim.x;
    int Nblocks = gridDim.x;
    float lam = (float)Params[7];

    // Calculate initial index based on current block and thread
    int ind = counter[1] + tidx + NthreadsX * bid;

    // Loop through all new spikes
    while (ind < counter[0]) {
        int tcurr = st[ind];
        float rMax = 0.0f;
        int idF = iList[tidy + Nnearest * id[ind]];

        // Minimize shared computation within the loop
        float mu_idF = mu[idF];
        float sqrt_term = sqrtf(lam / (mu_idF * mu_idF) + 1.0f);

        // Loop unrolling for performance improvement
        for (int t = -3; t < 3; t++) {
            float Ci = dout[tcurr + t + idF * NT] + lam / mu_idF;
            float Cf = Ci / sqrt_term;
            rMax = fmaxf(rMax, Cf);
        }
        
        // Write back the computed maximum feature
        d_feat[tidy + ind * Nnearest] = rMax;

        // Move to the next spike index for this thread
        ind += NthreadsX * Nblocks;
    }
}