```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Make1DprofileKernel (double *gridfield, double *axifield, int nsec, int nrad)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to store intermediate results for better memory access efficiency
    extern __shared__ double sdata[];

    if (i < nrad) {
        double sum = 0.0;
        int j;

        for (j = threadIdx.x; j < nsec; j += blockDim.x) {
            sum += gridfield[i * nsec + j];
        }

        sdata[threadIdx.x] = sum;
        __syncthreads();

        // Perform a reduction sum within the block
        for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (threadIdx.x < s) {
                sdata[threadIdx.x] += sdata[threadIdx.x + s];
            }
            __syncthreads();
        }

        if (threadIdx.x == 0) {
            axifield[i] = sdata[0] / (double)nsec;
        }
    }
}
```
