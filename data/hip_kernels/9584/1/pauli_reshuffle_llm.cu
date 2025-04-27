#include "hip/hip_runtime.h"
#include "includes.h"
/*This file is part of quantumsim. (https://github.com/brianzi/quantumsim)*/
/*(c) 2016 Brian Tarasinski*/
/*Distributed under the GNU GPLv3. See LICENSE.txt or https://www.gnu.org/licenses/gpl.txt*/

//kernel to transform to pauli basis (up, x, y, down)
//to be run on a complete complex density matrix, once for each bit
//this operation is its own inverse (can also be used in opposite direction)
__global__ void pauli_reshuffle(double *complex_dm, double *real_dm, unsigned int no_qubits, unsigned int direction) {

    const int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    const int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    const int size = 1 << no_qubits;
    
    // Early exit for threads out of bounds
    if (x >= size || y >= size) return;

    // Calculate if imaginary part is needed
    unsigned int v = ~x & y;
    unsigned int py = __popc(v) & 0x3;  // Calculate the population count using intrinsic

    // Calculate complex address
    const unsigned int addr_complex = (((x << no_qubits) | y) << 1) + (py & 1);

    // Interleave address for pauli basis
    unsigned int addr_real = 0;
    for (int i = 0; i < no_qubits; i++) {  // Use `no_qubits` instead of hardcoded value
        addr_real |= ((x & (1U << i)) << i) | ((y & (1U << i)) << (i + 1));
    }

    double sign = (py == 3 || py == 2) ? -1.0 : 1.0;

    // Avoid branch divergence
    if (direction == 0) {
        real_dm[addr_real] = sign * complex_dm[addr_complex];
    } else {
        complex_dm[addr_complex] = sign * real_dm[addr_real];
    }
}