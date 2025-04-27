#include "hip/hip_runtime.h"
#include "includes.h"
/*This file is part of quantumsim. (https://github.com/brianzi/quantumsim)*/
/*(c) 2016 Brian Tarasinski*/
/*Distributed under the GNU GPLv3. See LICENSE.txt or https://www.gnu.org/licenses/gpl.txt*/

//kernel to transform to pauli basis (up, x, y, down)
//to be run on a complete complex density matrix, once for each bit
//this operation is its own inverse (can also be used in opposite direction)
__global__ void get_diag(double *dm9, double *out, unsigned int no_qubits) {
    // Calculate linear global thread index
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Ensure we do not operate on indices beyond the data array
    if (x >= (1 << no_qubits)) return;

    // Precompute shifted index from original, assuming bits should interleave
    unsigned int addr_real = 0;
    unsigned int mask = 1U;
    for (int i = 0; i < 16; i++) {
        // Alternate shifting
        addr_real |= ((x & mask) << i) | ((x & mask) << (i + 1));
        mask <<= 1;
    }
    out[x] = dm9[addr_real];
}