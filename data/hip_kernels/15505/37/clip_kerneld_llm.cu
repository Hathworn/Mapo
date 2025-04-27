#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clip_kerneld(double *v, int n, double limit) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;  // Corrected initialization syntax
    if (x < n) {  // Inverted condition for better thread performance
        double val = v[x];
        v[x] = (val > limit) ? limit : ((val < -limit) ? -limit : val);  // Store v[x] in a register
    }
}