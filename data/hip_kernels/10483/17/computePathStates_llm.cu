#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void computePathStates(int noPaths, int noDims, int nYears, int noControls, int year, float unitCost, float unitRevenue, int* controls, int noFuels, float *fuelCosts, float *uResults, float *uComposition, int noUncertainties, int *fuelIdx, int noCommodities, float* aars, float* totalPops, float* xin, int* currControls) {
    
    // Global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < noPaths) {
        
        // 1. Adjusted population for each species
        for (int ii = 0; ii < noDims - 1; ii++) {
            // Use shared memory to minimize repeated global memory load
            extern __shared__ float sharedPops[];
            sharedPops[threadIdx.x * (noDims - 1) + ii] = totalPops[idx * (noDims - 1) * (nYears + 1) + year * (noDims - 1) + ii];
            __syncthreads();  // Synchronize threads in block
            xin[idx * noDims + ii] = sharedPops[threadIdx.x * (noDims - 1) + ii] * aars[idx * (nYears + 1) * noControls * (noDims - 1) + year * noControls * (noDims - 1) + ii * noControls + (noControls - 1)];
        }
        
        // 2. Unit profit
        float unitFuel = 0.0;
        float orePrice = 0.0;
        
        // Compute the unit fuel cost component
        for (int ii = 0; ii < noFuels; ii++) {
            unitFuel += fuelCosts[ii] * uResults[idx * (nYears + 1) * noUncertainties + (year) * noUncertainties + fuelIdx[ii]];
        }
        
        // Compute the unit revenue from ore
        for (int ii = 0; ii < noCommodities; ii++) {
            orePrice += uComposition[idx * nYears * noCommodities + (year) * noCommodities + ii] * uResults[idx * (nYears + 1) * noUncertainties + (year) * noUncertainties + noFuels + ii];
        }
        
        xin[idx * noDims + noDims - 1] = unitCost + unitFuel - unitRevenue * orePrice;
        currControls[idx] = controls[idx * nYears + year];
    }
}