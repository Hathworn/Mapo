```c
#include "hip/hip_runtime.h"
#include "includes.h"
#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to transform to Pauli basis (up, x, y, down)
// This operation is its own inverse and can be used in the opposite direction
__global__ void dm_reduce(double *dm, unsigned int bit, double *dm0, unsigned int state, unsigned int no_qubits) {

    // Calculate the global thread address
    const int addr = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Terminate threads that exceed matrix size
    if(addr >= (1 << (2 * no_qubits))) return;
    
    // Masks to extract bits related to the specified qubit
    const int low_mask = (1 << (2 * bit)) - 1;  // Mask for lower bits
    const int high_mask = (~low_mask) << 2;     // Mask for higher bits
    
    // Check if the relevant bits match the specified state
    if(((addr >> (2 * bit)) & 0x3) == state) {
        // Compute reduced address and perform transformation
        dm0[(addr & low_mask) | ((addr & high_mask) >> 2)] = dm[addr];
    }
}