#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DYbinaryentropyXsigmoidY(const int lengthX, const double *x, const double *y, const double *t, double *z)
{
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < lengthX)
    {
        // Precompute reused values for efficiency
        double exp_neg_y = exp(-y[i]);
        double sigmoid_y = 1.0 / (1.0 + exp_neg_y);
        
        // Perform the main computation
        z[i] += t[0] * (sigmoid_y - x[i]) / lengthX;
    }
}