#include "hip/hip_runtime.h"
#include "includes.h"

/*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*/

/**********************************
When updating a kernel or adding a new one,
please compile the ptx file and commit it:
nvcc -ptx -arch=sm_30 SystemML.cu
***********************************/

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void daxpy_matrix_vector(double* A, double* B, double alpha, double* ret, int rlenA, int clenA, int rlenB, int clenB) {
    // Calculate combined thread index for the matrix.
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int totalElements = rlenA * clenA;

    // Loop through the matrix in steps of total threads available.
    for (int index = tid; index < totalElements; index += blockDim.x * gridDim.x) {
        int ix = index / clenA;
        int iy = index % clenA;

        // Assign values based on row or column. 
        if (rlenB == 1) {
            ret[index] = A[index] + alpha * B[iy];
        } 
        else {
            ret[index] = A[index] + alpha * B[ix];
        }
    }
}