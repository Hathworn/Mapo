#include "hip/hip_runtime.h"
#include "includes.h"

/*
Copyright (C) 2009-2012 Fraunhofer SCAI, Schloss Birlinghoven, 53754 Sankt Augustin, Germany;
all rights reserved unless otherwise stated.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston,
MA 02111-1307 USA
*/

/** Index function to address the two-dimensional arrays
Q and R

Matrices are stored in column-major order (like Fortran).

i is the row, j is the column (index starts at 1)
ld is the number of elements for each column
*/

#define IDX2F(i,j,ld) ((((j)-1)*(ld))+((i)-1))

/* ---------------------------------------------------------------------- */

/*  Tuning can be done by different block sizes. */

#define BLOCK1 64

// 8800 GT:    128 x 1
// C1060:      128 x 1
#define BLOCK1X    64
#define BLOCK1Y    8

// 8800 GT:      64 x 4
// C1060:        64 x 8
#define BLOCK2X   512
#define BLOCK2Y   1

/** This kernel updates the matrix Q by a product of two vectors.

Q(1:m,k+1:n) -= R(k,k+1:n) * Q(1:m,k)

same as this BLAS-2 call:

call sger(M, N-K, -1.0, Q(1,K), 1, R(K,K+1), N, Q(1,K+1), M)

Each thread (t1,t2) will be responsible for BLOCK2X columns and BLOCK2Y
rows of the matrix Q.
*/

/**  QR factorization of a matrix

@param[in]      m is number of rows for Q and R
@param[in]      n is number of columns for Q and R
@param[in,out]  Q is a matrix of size m x n, column major order
@param[out]     R is a matrix of size m x n, column major order

@returns 0 if successful

Q(in) = Q(out) * R, where Q(out) is orthonormal and R upper-triangular
*/

__global__ void mult(float* Q, float* R, int m, int n, int k)
{
    __shared__ float RS[BLOCK1Y][BLOCK1X];
    __shared__ float QK[BLOCK1Y];

    int tid1 = threadIdx.x;
    int tid2 = threadIdx.y;

    int i = blockIdx.x * BLOCK1Y + tid2 + k;

    // Return early if out of bounds
    if (i < k || i > n) return;

    // Initialize local accumulators
    float S = 0.0f;

    // Use coalesced memory access
    for (int j = tid1 + 1; j <= m; j += BLOCK1X) {
        // Load QK once per row
        if (tid1 == 0) QK[tid2] = Q[IDX2F(j, k, m)];
        __syncthreads();
        S += QK[tid2] * Q[IDX2F(j, i, m)];
    }

    // Store in shared memory
    RS[tid2][tid1] = S;

    // Reduce in shared memory
    for (int NT = BLOCK1X >> 1; NT > 0; NT >>= 1) {
        __syncthreads();
        if (tid1 < NT) {
            RS[tid2][tid1] += RS[tid2][tid1 + NT];
        }
    }

    // Save result in R
    if (tid1 == 0) {
        R[IDX2F(k, i, n)] = RS[tid2][0];
    }
}