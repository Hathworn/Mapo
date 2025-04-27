#include "hip/hip_runtime.h"
#include "includes.h"
/* Kintsakis Athanasios AEM 6667 */

#define inf 9999

__global__ void funct2(int n, int k, float* x, int* qx)
{
    // Calculate global thread index
    int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure memory access is within bounds
    if (ix < n * n) {
        int j = ix & (n - 1); // Calculate column index
        float temp2 = x[ix - j + k] + x[k * n + j]; // Common subexpression
        if (x[ix] > temp2) { // Compare and update
            x[ix] = temp2;
            qx[ix] = k;
        }
    }
}