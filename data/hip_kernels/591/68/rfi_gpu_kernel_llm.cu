#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rfi_gpu_kernel(unsigned short *d_input, int nchans, int nsamp)
{
    int c = blockIdx.x * blockDim.x + threadIdx.x;

    if (c >= nchans) return; // Avoids out-of-bounds access

    float stdev = 1000000.0f;
    float mean = 0.0f;
    float cutoff;
    float data;
    float sum, sum_squares;
    int count;

    for(int out = 0; out < 4; out++) {
        sum = 0.0f;
        sum_squares = 0.0f;
        count = 0;
        cutoff = (4.0f * stdev); // Moved inside loop to avoid recalculation

        for(int t = 0; t < nsamp; t++) {
            data = (float)d_input[c * nsamp + t];
            if(data < (mean + cutoff) && data > (mean - cutoff)) {
                sum += data;
                sum_squares += (data * data);
                count++;
            }
        }
        if(count > 0) {
            mean = (sum / (float)count);
            sum_squares = ((sum_squares / count) - (mean * mean));
            stdev = sqrtf(sum_squares); // Use faster sqrtf for single precision
        }
    }

    for(int t = 0; t < nsamp - 4; t++) {
        data = 0.0f;
        for(int x = 0; x < 4; x++) {
            data += (float)d_input[c * nsamp + t + x];
        }
        data *= 0.25f;
        if(data > (mean + cutoff) || data < (mean - cutoff)) {
            d_input[c * nsamp + t] = (unsigned short)mean;
        }
    }
}
```
