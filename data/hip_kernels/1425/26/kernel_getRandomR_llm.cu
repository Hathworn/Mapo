#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_getRandomR(double* dev_mat, double* dev_ramR, int* dev_nc)
{
    // Shared memory optimization
    extern __shared__ double matS[];

    // Calculate thread id
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if insertion should occur for this image
    if (threadIdx.x < dev_nc[blockIdx.x]) 
    {
        double *mat = matS + threadIdx.x * 18;
        double *res = matS + threadIdx.x * 18 + 9;  // Use shared memory for res
        
        // Initialize mat elements
        mat[0] = 0; mat[4] = 0; mat[8] = 0;
        mat[5] = dev_ramR[tid * 4 + 1];
        mat[6] = dev_ramR[tid * 4 + 2];
        mat[1] = dev_ramR[tid * 4 + 3];
        mat[7] = -mat[5];
        mat[2] = -mat[6];
        mat[3] = -mat[1];

        // Clear res elements using shared memory
        for(int i = 0; i < 9; i++)
            res[i] = 0;

        // Matrix multiplication optimization
        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                double sum = 0;  // Use local variable for sum
                for (int k = 0; k < 3; k++)
                {
                    sum += mat[i + k * 3] * mat[k + j * 3];
                }
                res[i + j * 3] = sum;
            }
        }

        double scale = 2.0 * dev_ramR[tid * 4];
        
        // Perform scaling and sum operations
        for (int n = 0; n < 9; n++)
        {
            mat[n] *= scale;
            mat[n] += res[n] * 2.0;
        }

        // Add identity matrix component
        mat[0] += 1.0;
        mat[4] += 1.0;
        mat[8] += 1.0;

        // Write result to global memory
        for (int n = 0; n < 9; n++)
        {
            dev_mat[tid * 9 + n] = mat[n];
        }
    }
}