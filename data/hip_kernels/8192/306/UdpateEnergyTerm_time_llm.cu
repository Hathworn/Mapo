#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void UdpateEnergyTerm_time(float* energy, int energy_dim, int nPatches, float* idFocuser_focused, float par_time_increase_energy_on_focus, float par_time_decrease_energy_in_time)
{
    // Compute global thread index directly with less computation
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (id < energy_dim * nPatches) {
        int idDim = id % energy_dim;
        int idPatch = id / energy_dim;
        if (idDim == 0) { // Time dimension check
            // Use ternary operator for concise conditional energy update
            energy[id] = (idPatch == static_cast<int>(*idFocuser_focused)) ? 
                         (energy[id] + par_time_increase_energy_on_focus) : 
                         (energy[id] / par_time_decrease_energy_in_time);
        }
    }
}