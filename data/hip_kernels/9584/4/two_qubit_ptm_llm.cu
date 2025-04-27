```c
#include "hip/hip_runtime.h"
#include "includes.h"
/*This file is part of quantumsim. (https://github.com/brianzi/quantumsim)*/
/*(c) 2016 Brian Tarasinski*/
/*Distributed under the GNU GPLv3. See LICENSE.txt or https://www.gnu.org/licenses/gpl.txt*/

__global__ void two_qubit_ptm(double *dm, double *ptm_g, unsigned int bit0, unsigned int bit1, unsigned int no_qubits) {
    const unsigned int x = threadIdx.x;
    const unsigned int high_x = blockIdx.x * blockDim.x;

    extern __shared__ double ptm[];
    double *data = &ptm[256]; // Shared memory for data

    int higher_bit = max(bit0, bit1);
    int lower_bit = min(bit0, bit1);
    int high_mask = ~((1 << (2 * higher_bit + 2)) - 1);
    int mid_mask = (~((1 << (2 * lower_bit + 4)) - 1)) & (~high_mask);
    int low_mask = ~(high_mask | mid_mask) & (~0xf);

    int pos = high_x | x;
    int global_from =
        (pos & high_mask)
        | ((pos & mid_mask) >> 2)
        | ((pos & low_mask) >> 4)
        | ((pos & 0x3) << (2 * bit0))
        | (((pos & 0xc) >> 2) << (2 * bit1));

    // Load ptm to shared memory, ensuring all necessary values are loaded
    for (int i = x; i < 256; i += blockDim.x) {
        ptm[i] = ptm_g[i];
    }
    __syncthreads();

    if (high_x + x >= (1 << (2 * no_qubits))) return;

    // Load data block to shared memory
    data[x] = dm[global_from];
    __syncthreads();

    unsigned int row = x & 0xf;
    unsigned int idx = x & ~0xf;

    double acc = 0;
    // Accumulate the result using matrix-vector multiplication
    for (int i = 0; i < 16; i++) {
        acc += ptm[16 * row + i] * data[idx + i];
    }

    // Store the accumulated result
    dm[global_from] = acc;
}