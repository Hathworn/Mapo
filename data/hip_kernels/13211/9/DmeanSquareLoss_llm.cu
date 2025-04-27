#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DmeanSquareLoss(const int lengthx, const double pref, const double *gradc, const double *x, const double *y, double *gradn)
{
    // Efficiently process multiple elements per thread for better utilization
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    
    for (int i = idx; i < lengthx; i += stride) {
        gradn[i] += pref * gradc[0] * (x[i] - y[i]);
    }
}