#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void Kernel_gaus(float *Vd, float *Ris, float *Nd, int N, int C, int dim_indici, int *ind, float sigma, int *Vp, int *Vnp, int nr_max_val)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= N || y >= dim_indici) return; // Boundary check

    int j;
    int pos;
    int tmp_ind = ind[y];
    float gaus = 0.0;

    int Nr_val = Vnp[x];

    for(j = 0; j < Nr_val; j++)
    {
        pos = Vp[x * nr_max_val + j];
        gaus += (Vd[x * C + pos] * Vd[tmp_ind * C + pos]); // Use of compound assignment
    }

    gaus = -2.0f * gaus + Nd[x] + Nd[tmp_ind];
    gaus = exp(-gaus * sigma); // Move operation to a separate line for clarity

    Ris[y * N + x] = gaus;
}