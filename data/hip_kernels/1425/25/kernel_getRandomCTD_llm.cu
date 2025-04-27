#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_getRandomCTD(double* dev_nt, double* dev_tran, double* dev_nr, double* dev_ramR, unsigned int out, int rSize, int tSize )
{
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    hiprandState s;
    hiprand_init(out, tid, 0, &s);

    // Get random index for dev_tran
    float myrand_t = hiprand_uniform(&s) * tSize;
    int t = ((int)truncf(myrand_t) + blockIdx.x * tSize) * 2;
    for (int n = 0; n < 2; n++)
    {
        dev_tran[tid * 2 + n] = dev_nt[t + n];
    }

    // Get random index for dev_ramR
    float myrand_r = hiprand_uniform(&s) * rSize;
    int r = ((int)truncf(myrand_r) + blockIdx.x * rSize) * 4;
    for (int n = 0; n < 4; n++)
    {
        dev_ramR[tid * 4 + n] = dev_nr[r + n];
    }
}