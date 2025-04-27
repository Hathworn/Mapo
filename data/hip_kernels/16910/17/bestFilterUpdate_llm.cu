#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 100000, NrankMax = 3, nmaxiter = 500, NchanMax = 32;

__global__ void bestFilterUpdate(const double *Params, const float *data, const float *mu, float *err, float *eloss, int *ftype, const int *st, const int *id, const int *counter) {
    int tid = threadIdx.x;
    int NT = (int) Params[0];
    int Nfilt = (int) Params[1];
    float lam = (float) Params[7];
    int nt0 = (int) Params[4];

    int ind = counter[1] + blockIdx.x;

    if (ind < counter[0]) {
        int t = st[ind] - nt0 + tid;
        if (t >= 0 && t < NT) {
            float Cbest = -1.0f;  // Improves comparison and ensures updates
            float Cnextbest = -1.0f;  // Tracks second best score
            int ibest = -1;  // Tracks index of the best score

            for (int i = 0; i < Nfilt; i++) {
                float a = 1 + lam;
                float b = max(0.0f, data[t + NT * i]) + lam * mu[i];

                float Cf = b * b / a - lam * mu[i] * mu[i];

                if (Cf > Cbest) {
                    Cnextbest = Cbest;  // Update second best
                    Cbest = Cf;  // Update best
                    ibest = i;  // Update index
                } else if (Cf > Cnextbest) {
                    Cnextbest = Cf;  // Update second best only
                }
            }
            err[t] = Cbest;
            ftype[t] = ibest;
        }
    }
}