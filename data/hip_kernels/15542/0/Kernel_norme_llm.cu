#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better performance
__global__ void Kernel_norme(float *Vd, float *Nd, int *Vp, int *Vnp, int N, int C, int nr_max_val)
{
    // Calculate global thread index
    long int x = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure the thread operates only within valid range
    if(x < N)
    {
        float norma = 0;  // Initialize norma to zero

        // Fetch number of relevant values from shared memory for efficiency
        int Nr_val = Vnp[x];

        // Loop over the relevant values for computation
        for(int i = 0; i < Nr_val; i++)
        {
            int pos = Vp[x * nr_max_val + i];  // Get position from Vp
            float val = Vd[x * C + pos];  // Fetch value from Vd for computation
            norma += val * val;  // Accumulate square of value to norma
        }

        // Write norma result back to global memory
        Nd[x] = norma;
    }
}