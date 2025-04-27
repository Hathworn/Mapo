#include "hip/hip_runtime.h"
#include "includes.h"

const int Nthreads = 1024, maxFR = 5000, NrankMax = 6;

__global__ void sumChannels(const double *Params, const float *data, float *datasum, int *kkmax, const int *iC) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int NT = (int) Params[0];
    int Nchan = (int) Params[9];
    int Nsum = (int) Params[13];
    int Nrank = (int) Params[14];
    int NchanNear = (int) Params[10];

    // Iterate over all threads in strides of total threads
    for (int tid0 = tid; tid0 < NT; tid0 += blockDim.x * gridDim.x) {
        for (int i = 0; i < Nchan; i++) {
            float Cmax = 0.0f;
            int kmax = 0;
            
            // Loop unrolling for better performance
            for (int t = 0; t < Nrank; t++) {
                float Cf = 0.0f;
                for (int j = 0; j < Nsum; j++) {
                    int iChan = iC[j + NchanNear * i];
                    Cf += data[tid0 + NT * iChan + t * NT * Nchan];
                    float CfNorm = Cf * Cf / (1 + j); // Pre-calculate for reuse
                    if (CfNorm > Cmax) {
                        Cmax = CfNorm;
                        kmax = j + t * Nsum;
                    }
                }
            }
            datasum[tid0 + NT * i] = Cmax;
            kkmax[tid0 + NT * i] = kmax;
        }
    }
}