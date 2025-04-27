#include "hip/hip_runtime.h"
#include "includes.h"

// GPU function to converts the provided dBm value to mW.
// The power in milliwatts (P(mW)) is equal to 1mW times 10 raised by the
// power in decibel-milliwatts (P(dBm)) divided by 10:
// P(mW) = 1mW * 10 ^ (P(dBm) / 10)
__device__ float convertDbmToMw(const float dBm)
{
    return powf(10.0f, dBm / 10.0f);
}

__global__ void convertDbmToMwKernal(float *result, const float *data, unsigned int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (i < size) {
        // Compute dBm to mW conversion for valid index
        result[i] = convertDbmToMw(data[i]);
    }
}
```
