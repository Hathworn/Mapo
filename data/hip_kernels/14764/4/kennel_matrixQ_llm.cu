#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double atomicAdd_dB(double* address, double val)
{
    unsigned long long int* address_as_ull = (unsigned long long int*)address;
    unsigned long long int old = *address_as_ull, assumed;

    do {
        assumed = old;
        old = atomicCAS(address_as_ull, assumed,
                        __double_as_longlong(val +
                                             __longlong_as_double(assumed)));
        // Integer comparison avoids hang if NaN
    } while (assumed != old);

    return __longlong_as_double(old);
}

__device__ double atomicAdd_d(double* address, double val)
{
    unsigned long long int* address_as_ull = (unsigned long long int*)address;
    unsigned long long int old = *address_as_ull, assumed;

    do {
        assumed = old;
        old = atomicCAS(address_as_ull, assumed,
                        __double_as_longlong(val +
                                             __longlong_as_double(assumed)));
        // Integer comparison avoids hang if NaN
    } while (assumed != old);

    return __longlong_as_double(old);
}

__global__ void kennel_matrixQ(double *d_P, double *d_px, double *d_py, double *d_Q, int Ng)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid >= Ng * Ng) return;  // Ensure tid is within bounds

    int rownum = tid / Ng;
    int colnum = tid % Ng;
    double sum = 0.0;  // Accumulate partial results

    for (int k = 0; k < Ng; ++k)
    {
        double px = d_px[rownum];
        double py = d_py[k];
        if (px != 0 && py != 0)  // Protect against division by zero
        {
            double temp = d_P[k + rownum * Ng] * d_P[k + colnum * Ng] / px / py;
            sum += temp;  // Accumulate results
        }
    }
    atomicAdd_dB(&d_Q[(tid + Ng)], sum); // Use atomic add for final result
}