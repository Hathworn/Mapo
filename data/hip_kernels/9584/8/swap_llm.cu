#include "hip/hip_runtime.h"
#include "includes.h"
/*This file is part of quantumsim. (https://github.com/brianzi/quantumsim)*/
/*(c) 2016 Brian Tarasinski*/
/*Distributed under the GNU GPLv3. See LICENSE.txt or https://www.gnu.org/licenses/gpl.txt*/


//kernel to transform to pauli basis (up, x, y, down)
//to be run on a complete complex density matrix, once for each bit
//this operation is its own inverse (can also be used in opposite direction)
__global__ void swap(double *dm, unsigned int bit1, unsigned int bit2, unsigned int no_qubits) {
    unsigned int addr = threadIdx.x + blockDim.x * blockIdx.x;

    if (addr >= (1 << (2 * no_qubits))) return;

    unsigned int bit1_mask = (0x3 << (2 * bit1));
    unsigned int bit2_mask = (0x3 << (2 * bit2));

    // Calculate addr2 without separate masking and shifting
    unsigned int addr2 = addr ^ (((addr >> (2 * bit1)) ^ (addr >> (2 * bit2))) & 0x3) << (2 * bit1) 
                                ^ (((addr >> (2 * bit1)) ^ (addr >> (2 * bit2))) & 0x3) << (2 * bit2);

    // Perform swap if necessary
    if (addr < addr2) {
        double t = dm[addr];
        dm[addr] = dm[addr2];
        dm[addr2] = t;
    }
}