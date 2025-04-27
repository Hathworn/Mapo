#include "hip/hip_runtime.h"
#include "includes.h"
/**********************************************************
* @author  Pulkit Verma
* @email   technopreneur[dot]pulkit[at]gmail[dot]com
**********************************************************/

// The program takes two equal size vectors as input and outputs their vector sum

// Optimized vecAdd kernel function
__global__ void vecAdd(float *in1, float *in2, float *out, int len)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into registers to reduce memory access and ensure warp efficiency
    float val1 = (i < len) ? in1[i] : 0.0f;
    float val2 = (i < len) ? in2[i] : 0.0f;

    // Compute the output if within bounds
    if (i < len) {
        out[i] = val1 + val2;
    }
}