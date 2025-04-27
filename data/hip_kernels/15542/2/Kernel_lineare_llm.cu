#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized Kernel function
__global__ void Kernel_lineare(float *Vd, float *Ris, int N, int C, int dim_indici, int *ind, int *Vp, int *Vnp, int nr_max_val)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int stride_x = blockDim.x * gridDim.x; // Loop stride for x

    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int stride_y = blockDim.y * gridDim.y; // Loop stride for y

    while (x < N) 
    {
        while (y < dim_indici)
        {
            int tmp_ind = ind[y];
            float lin = 0.0f;
            int Nr_val = Vnp[x];

            for(int j = 0; j < Nr_val; j++)
            {
                int pos = Vp[x * nr_max_val + j];
                lin += Vd[x * C + pos] * Vd[tmp_ind * C + pos];
            }
            
            Ris[y * N + x] = lin;
            y += stride_y; // Increment y by its stride
        }
        x += stride_x; // Increment x by its stride
    }
}