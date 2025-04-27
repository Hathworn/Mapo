#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void UdpateEnergyTerm_time(float* energy, int energy_dim, int nPatches, float* idFocuser_focused, float par_time_increase_energy_on_focus, float par_time_decrease_energy_in_time) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified global thread ID calculation
    if (id < energy_dim * nPatches) {  // Ensure id is within bounds
        int idDim = id % energy_dim;
        int idPatch = id / energy_dim;

        if (idDim == 0) {  // Check if this is the 'time' dimension
            if (idPatch == static_cast<int>(*idFocuser_focused)) {  // Check for focus
                energy[id] += par_time_increase_energy_on_focus;
            } else {
                energy[id] /= par_time_decrease_energy_in_time;
            }
        }
    }
}