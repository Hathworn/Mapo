#include "hip/hip_runtime.h"
#include "includes.h"

double* x;
int numSMs;

__global__ void minus_gra(double* gra, int size) {
    // Calculate global index for the current thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Process the work in a coalesced manner
    while (index < size) {
        gra[index] = -gra[index];  // Directly negate the value
        index += blockDim.x * gridDim.x;  // Move to the next step
    }
}