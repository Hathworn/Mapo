#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel for element solution assembly
__global__ void glob_sols(float *Le, float *w, float *u_glob, float *ue, int *cells, int num_cells)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = threadIdx.y;  // Use threadIdx.y directly
    int v;
    float Lii, weight;

    if(idx < num_cells && idy < 3) { // Limit idy within valid range (0-2)
        v = cells[idx * 3 + idy];  // getting global vertex number
        Lii = Le[idx * 9 + idy * 3 + idy];

        weight = Lii / w[v];

        atomicAdd(&u_glob[v], weight * ue[idx * 3 + idy]);
    }
}