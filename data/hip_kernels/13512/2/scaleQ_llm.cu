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

/* ---------------------------------------------------------------------- */

/* Kernel for scaling the column k of the matrix Q. */

__global__ void scaleQ(float* Q, float* R, int m, int n, int k, float S)
{
    // Compute global row index for current thread
    int row = blockIdx.x * blockDim.x + threadIdx.x;

    // Check for boundary condition
    if (row < m) {
        // Perform scaling operation
        Q[IDX2F(row + 1, k, m)] *= S;
    }
}