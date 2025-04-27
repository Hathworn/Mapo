#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void randControls(int noPaths, int nYears, int noControls, float* randCont, int* control) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = gridDim.x * blockDim.x;
    
    // Loop to handle more elements per thread for larger datasets
    for (int i = idx; i < noPaths * nYears; i += totalThreads) {
        int ctrlValue = (int)(randCont[i] * noControls);
        control[i] = (ctrlValue == noControls) ? (noControls - 1) : ctrlValue;
    }
}