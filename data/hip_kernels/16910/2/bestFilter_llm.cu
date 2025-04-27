```c
#include "hip/hip_runtime.h"
#include "includes.h"
const int  Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void  bestFilter(const double *Params, const float *data, float *err, int *ftype, int *kkmax, int *kall) {
    int tid = threadIdx.x;
    int bid = blockIdx.x;
    int NT = (int) Params[0];
    int Nchan = (int) Params[9];

    int tid0 = tid + bid * blockDim.x;

    // Use simple loop unrolling to decrease branching
    for (; tid0 < NT; tid0 += blockDim.x * gridDim.x) {
        float Cbest = 0.0f;
        int ibest = 0;
        int kbest = 0;

        for (int i = 0; i < Nchan; i++) {
            float Cf = data[tid0 + NT*i];
            if (Cf > Cbest + 1e-6) {
                Cbest = Cf;
                ibest = i;
                kbest = kkmax[tid0 + NT*i];
            }
        }
        err[tid0] = Cbest;
        ftype[tid0] = ibest;
        kall[tid0] = kbest;
    }
}