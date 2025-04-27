#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void calcEnergyParallel(int *atoms, int numAtoms, int *energies, int numEnergies)
{
    int atom1 = blockIdx.x; 
    int atom2 = blockIdx.y * blockDim.x + threadIdx.x;
    if (atom2 >= numAtoms || atom2 <= atom1) return;

    // Calculate energy index more efficiently
    int energyIdx = (2 * numAtoms - atom1 - 3) * atom1 / 2 + atom2 - atom1 - 1;

    energies[energyIdx] = atoms[atom1] * atoms[atom2];
}