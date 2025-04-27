#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UdpateEnergyTerm_movement( float* energy, int energy_dim, int nPatches, float *desc, int desc_dim, int id_desc_move) 
{
    // Optimize block size calculation
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int idDim = id % energy_dim;
    int idPatch = id / energy_dim;

    // Ensure id is within valid range and access only required memory
    if (id < energy_dim * nPatches && idDim == 1) {
        energy[id] = -desc[idPatch * desc_dim + id_desc_move];
    }
}