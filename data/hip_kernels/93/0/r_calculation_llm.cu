#include "hip/hip_runtime.h"
#include "includes.h"

char* concat(char *s1, char *s2);

__global__ void r_calculation(float* a, int* indeces, float* b, float* x, float* r, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    if (index < size)
    {
        // Use shared memory for performance improvement
        __shared__ float shared_a[3], shared_x[3];
        float sum = 0;

        #pragma unroll // Unroll loop to reduce overhead
        for (int i = 0; i < 3; i++)
        {
            // Load data into shared memory
            int idx = 3 * index + i;
            shared_a[i] = a[idx];
            shared_x[i] = x[indeces[idx]];
            __syncthreads(); // Ensure all threads have loaded the data

            sum += shared_a[i] * shared_x[i];
        }

        r[index] = b[index] - sum;
    }
}