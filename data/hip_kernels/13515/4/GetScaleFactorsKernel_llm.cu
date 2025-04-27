#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetScaleFactorsKernel(float *indata, float *base, float *stdev, float *factors, int nchans, int processed) {

    // Cache variables for better performance
    __shared__ float shared_mean;
    __shared__ float shared_estd;

    // Initialize shared memory
    if (threadIdx.x == 0) {
        shared_mean = 0.0f;
        shared_estd = stdev[threadIdx.x] * stdev[threadIdx.x] * (processed - 1.0f);
    }
    __syncthreads();

    float mean = shared_mean;
    float estd = shared_estd;
    float oldmean = base[threadIdx.x];

    float val = 0.0f;
    float diff = 0.0f;

    // Updated to use local registers as much as possible
    for (int isamp = 0; isamp < 2 * NACCUMULATE; ++isamp) {
        val = indata[isamp * nchans + threadIdx.x];
        diff = val - oldmean;
        mean = oldmean + diff * factors[processed + isamp + 1];
        estd += diff * (val - mean);
        oldmean = mean;
    }

    // Store results back to global memory
    if (threadIdx.x == 0) {
        base[threadIdx.x] = mean;
        stdev[threadIdx.x] = sqrtf(estd / (float)(processed + 2 * NACCUMULATE - 1.0f));
    }
}