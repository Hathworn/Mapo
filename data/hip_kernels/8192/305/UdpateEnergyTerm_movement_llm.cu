#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UdpateEnergyTerm_movement(float* energy, int energy_dim, int nPatches, float *desc, int desc_dim, int id_desc_move) {

    // Calculate unique global index using grid and block dimensions
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    
    // Check within bounds
    if (id < energy_dim * nPatches) {
    
        // Compute indices corresponding to dimensions and patches
        int idDim   = id % energy_dim;
        int idPatch = id / energy_dim;

        // Directly update energy with movement condition
        if (idDim == 1) {
            // Update energy value corresponding to movement
            energy[id] = -desc[idPatch * desc_dim + id_desc_move];
        }
    }
}