#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void jacobiFirstLocal(float *x, const float *diagonal_values, const float *non_diagonal_values, const int *indeces, const float *y, const int size)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index < size)
    {
        float local_diagonal_value = diagonal_values[index];
        float local_non_diagonal_values[2] = {non_diagonal_values[2 * index], non_diagonal_values[2 * index + 1]};
        int local_indeces[2] = {indeces[2 * index], indeces[2 * index + 1]};
        float local_y = y[index];

        float error = 1.0f;
        float current_value = x[index];  // Use initial value of x for more efficient convergence
        float sum = 0.0f;

        while (fabsf(error) > 0.00001)
        {
            sum = local_non_diagonal_values[0] * x[local_indeces[0]] + local_non_diagonal_values[1] * x[local_indeces[1]];  // Pre-compute sum

            float new_value = (local_y - sum) / local_diagonal_value;  // Calculate new value
            error = new_value - current_value;  // Compute error
            current_value = new_value;  // Update current value

            x[index] = current_value;  // Write back current value
            __syncthreads();
        }
    }
}
```
