#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void jacobiFirstLocal(float *x, const float *diagonal_values, const float *non_diagonal_values, const int *indeces, const float *y, const int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    float error = 1;
    float current_value = 1;

    if (index < size)
    {
        float local_diagonal_value = diagonal_values[index];
        float local_non_diagonal_values[2] = {
            non_diagonal_values[2 * index],
            non_diagonal_values[2 * index + 1]
        };
        
        int local_indeces[2] = {
            indeces[2 * index],
            indeces[2 * index + 1]
        };
        
        float local_y = y[index];
        
        while (fabsf(error) > 0.00001) // Simplify error check condition
        {
            float sum = local_non_diagonal_values[0] * x[local_indeces[0]] +
                        local_non_diagonal_values[1] * x[local_indeces[1]];

            current_value = (local_y - sum) / local_diagonal_value;
            error = current_value - x[index];
            x[index] = current_value;

            __syncthreads(); // Ensure all threads are in sync for current iteration
        }
    }
}