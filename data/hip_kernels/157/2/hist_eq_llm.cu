#include "hip/hip_runtime.h"
#include "includes.h"

#define HISTOGRAM_LENGTH 256

__global__ void hist_eq(unsigned char * deviceCharImg, float * output, float* cdf, float cdfmin, int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize thread index calculation

    if(i < size)
    {
        float val = deviceCharImg[i]; // Cache repeated memory access
        deviceCharImg[i] = min(max(255 * (cdf[val] - cdfmin) / (1 - cdfmin), 0.0f), 255.0f); // Simplify expression with cached value

        output[i] = deviceCharImg[i] / 255.0f; // Use float division directly
    }
}