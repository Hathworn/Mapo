#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void lhkde(const int n, const float *a, const float *b, float *l, float *h) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < n) {
        float ai = a[i];      // Load a[i] once
        float bi = 3 * b[i];  // Compute 3 * b[i] once
        l[i] = ai - bi;       // Use stored ai and bi
        h[i] = ai + bi;       // Use stored ai and bi
    }
}