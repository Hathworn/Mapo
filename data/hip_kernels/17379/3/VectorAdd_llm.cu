#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VectorAdd(int *a, int *r, int n, double gamma)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < n)
    {
        double normalized_a = (double)a[i] / 255.0; // Normalize input value
        r[i] = (int)(255.0 * pow(normalized_a, 1.0 / gamma)); // Compute result using power function
    }
}