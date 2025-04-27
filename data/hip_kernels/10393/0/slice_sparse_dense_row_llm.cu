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

extern "C"
__global__ void slice_sparse_dense_row(double* inVal, int* inRowPtr, int* colInd, double* ret, int rl, int ru, int cl, int cu, int retClen) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int rowIndex = index + rl;
    
    // Ensure row index is within bounds
    if (rowIndex <= ru){
        // Cache read boundaries
        int start = inRowPtr[rowIndex];
        int end = inRowPtr[rowIndex + 1];
        
        // Loop over the non-zero elements in the sparse row
        for(int i = start; i < end; i++) {
            int colIdx = colInd[i];
            
            // Check if column index is within the slice range
            if(cl <= colIdx && colIdx <= cu) {
                ret[index * retClen + (colIdx - cl)] = inVal[i]; // Assign value to output
            }
        }
    }
}