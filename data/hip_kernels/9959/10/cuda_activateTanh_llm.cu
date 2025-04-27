#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_activateTanh(double* pA, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use alternative calculation of tanh for better performance
    if (id < n) {
        double x = pA[id];
        double e2x = exp(2.0 * x);
        pA[id] = (e2x - 1.0) / (e2x + 1.0); // Utilize exp for tanh calculation
    }
}