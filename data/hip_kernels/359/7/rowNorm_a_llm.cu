#include "hip/hip_runtime.h"
#include "includes.h"

/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/

__global__ void rowNorm_a( float* X, float* v, float* a, unsigned int size, unsigned int n)
{
    // Calculate flat thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Use these values outside the loop since they are constant for each row
    unsigned int row;
    float v_val, a_val;

    if (idx < size) { // Check if thread should participate
        row = idx / n; // Pre-calculate row index
        v_val = v[row];
        a_val = a[row];

        for (unsigned long int i = idx; i < size; i += blockDim.x * gridDim.x) {
            // Efficiently use pre-calculated values
            X[i] /= v_val * a_val;
        }
    }
}