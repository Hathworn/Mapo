#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to compute binary entropy
__global__ void binaryentropy(const int lengthX, const double *x, const double *y, double *z)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    if (i < lengthX) 
    {
        double xi = x[i]; // Cache x[i] in register
        double yi = y[i]; // Cache y[i] in register

        // Compute binary entropy
        z[i] = xi * log(xi / yi) + (1.0 - xi) * log((1.0 - xi) / (1.0 - yi));
    }
}