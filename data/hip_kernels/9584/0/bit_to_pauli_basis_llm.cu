#include "hip/hip_runtime.h"
#include "includes.h"
/*This file is part of quantumsim. (https://github.com/brianzi/quantumsim)*/
/*(c) 2016 Brian Tarasinski*/
/*Distributed under the GNU GPLv3. See LICENSE.txt or https://www.gnu.org/licenses/gpl.txt*/

// kernel to transform to pauli basis (up, x, y, down)
// to be run on a complete complex density matrix, once for each bit
// this operation is its own inverse (can also be used in opposite direction)
__global__ void bit_to_pauli_basis(double *complex_dm, unsigned int mask, unsigned int no_qubits) {
    const int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    const int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    const double sqrt2 = 0.70710678118654752440;

    // Return if out of bounds
    if ((x >= (1 << no_qubits)) || (y >= (1 << no_qubits))) return;

    // Calculate addresses only once
    int x_masked = x & mask;
    int y_masked = y & mask;
    int x_unmasked = x & ~mask;
    int y_unmasked = y & ~mask;
    int b_addr = ((x_masked << 1) | x_unmasked) << no_qubits | y_unmasked;
    int c_addr = (x_unmasked << no_qubits) | ((y_masked << 1) | y_unmasked);
    
    double *b_ptr = complex_dm + (b_addr << 1);
    double *c_ptr = complex_dm + (c_addr << 1);

    if (x_masked && !y_masked) {
        double b = *b_ptr;
        double c = *c_ptr;
        *b_ptr = (b + c) * sqrt2;
        *c_ptr = (b - c) * sqrt2;
    }

    if (!x_masked && y_masked) {
        b_ptr++;
        c_ptr++;
        double b = *b_ptr;
        double c = *c_ptr;
        *b_ptr = (b + c) * sqrt2;
        *c_ptr = (b - c) * sqrt2;
    }
}