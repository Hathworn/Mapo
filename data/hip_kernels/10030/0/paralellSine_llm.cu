#include "hip/hip_runtime.h"
#include "includes.h"

// problem size (vector length) N
static const int N = 12345678;

// Number of terms to use when approximating sine
static const int TERMS = 6;

// kernel function (CPU - Do not modify)
__global__ void paralellSine(float *input, float *output)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Proper indexing of elements
    if (idx >= N) return; // Boundary check to prevent invalid memory access

    float value = input[idx];
    float numer = value * value * value;
    int denom = 6;
    int sign = -1;

    #pragma unroll // Unroll loop for better performance
    for (int j = 1; j <= TERMS; j++)
    {
        value += sign * numer / denom;
        numer *= value * value;
        denom *= (2 * j + 2) * (2 * j + 3);
        sign *= -1;
    }
    output[idx] = value;
}