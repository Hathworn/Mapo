#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_getRandomCTD(double* dev_nt, double* dev_tran, double* dev_nd, double* dev_ramD, double* dev_nr, double* dev_ramR, unsigned int out, int rSize, int tSize, int dSize )
{
    // Calculate global thread index
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Initialize random state
    hiprandState s;
    hiprand_init(out, tid, 0, &s);

    // Optimize random coordinate calculation for tran
    float myrand = hiprand_uniform(&s);
    int t = ((int)truncf(myrand * tSize) + blockIdx.x * tSize) * 2;
    for (int n = 0; n < 2; n++)
    {
        dev_tran[tid * 2 + n] = dev_nt[t + n];
    }

    // Optimize random coordinate calculation for ramR
    myrand = hiprand_uniform(&s);
    int r = ((int)truncf(myrand * rSize) + blockIdx.x * rSize) * 4;
    for (int n = 0; n < 4; n++)
    {
        dev_ramR[tid * 4 + n] = dev_nr[r + n];
    }

    // Optimize random coordinate calculation for ramD
    myrand = hiprand_uniform(&s);
    dev_ramD[tid] = dev_nd[blockIdx.x * dSize + (int)truncf(myrand * dSize)];
}