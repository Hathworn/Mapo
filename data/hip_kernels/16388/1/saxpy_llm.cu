#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void saxpy(int n, float a, float *x, float *y, char *ad, char *bd)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        y[i] = a * x[i] + y[i]; // Calculate SAXPY
        if (i == 0) { // Set ad[0] only for the first thread
            ad[0] = 'C';
        }
    }
}