#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

// Optimized Kernel function
__global__ void Kernel_polimoniale(float *Vd, float *Ris, int N, int C, int dim_indici, int *ind, int *Vp, int *Vnp, int nr_max_val, int s)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Cache y in a register for reduced global memory access
    int local_y = y;

    while (x < N) {
        while (local_y < dim_indici) {
            
            // Load tmp_ind into registers to reduce global memory access
            int tmp_ind = ind[local_y];
            float tmp = 1.0; // Use registers for tmp
            float pol = 0.0; // Use registers for pol

            int Nr_val = Vnp[x];

            // Unroll loop for better instruction-level parallelism
            #pragma unroll
            for (int j = 0; j < Nr_val; j++) {
                int pos = Vp[x * nr_max_val + j];
                pol += Vd[x * C + pos] * Vd[tmp_ind * C + pos];
            }

            pol += 1;

            // Use multiplication instead of a loop for power calculations
            float pol_power = pol;
            for (int j = 1; j < s; j++) {
                pol_power *= pol;
            }

            Ris[local_y * N + x] = pol_power;
            local_y += blockDim.y * gridDim.y;
        }
        x += blockDim.x * gridDim.x;
    }
}