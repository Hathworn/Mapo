#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ComputeLaplacianInPlace(float* d, int n)
{
    // Calculate global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within the matrix bounds
    if(x < n)
    {
        auto dCol = &d[x * n];
        float sum = 0;

        // Loop unrolling and calculate column sum
        for(int i = 0; i < n; i += 2)
        {
            if(i != x) 
            {
                sum += dCol[i];
                dCol[i] = -dCol[i];
            }
            if(i + 1 != x && i + 1 < n) 
            {
                sum += dCol[i + 1];
                dCol[i + 1] = -dCol[i + 1];
            }
        }
        
        // Separate updates outside the loop to prevent race conditions
        dCol[x] += sum;
    }
}