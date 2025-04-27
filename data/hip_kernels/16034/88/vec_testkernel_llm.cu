#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_testkernel (int n, double *result, double  *x, double  *y)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    // Check if id is within bounds for safety
    if (id < n)
    {
        double temp_x = x[id]; // Load value from global memory
        double temp_y = y[id]; // Load value from global memory
        double precomputedValue = sqrt(pow(3.14159, id)); // Precompute sqrt value
        for (int j = 0; j < 100; j++)
        {
            result[id] = temp_x * temp_y + precomputedValue; // Use temporary variables
        }
    }
}