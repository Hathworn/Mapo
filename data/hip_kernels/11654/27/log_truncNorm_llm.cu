#include "hip/hip_runtime.h"
#include "includes.h"
__device__ double dnorm(float x, float mu, float sigma)
{
    float std = (x - mu)/sigma;
    float e = exp(-0.5 * std * std);
    return e / (sigma * sqrt(2 * 3.141592653589793));
}

__global__ void log_truncNorm(float *out, float *unifVals, int N)
{
    // Combine block and thread indices to form global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < N) {
        // Calculate log of value scaled by density
        out[idx] = log(unifVals[idx]) * dnorm(unifVals[idx], 0, 1) / 0.3413447460685;
    }
}