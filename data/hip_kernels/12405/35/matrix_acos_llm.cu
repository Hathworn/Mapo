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
* Optimized kernel function to compute acos for each element
* @param A input array
* @param C output array
* @param size number of elements in the arrays
*/
extern "C"
__global__ void matrix_acos(double *A, double *C, unsigned int size) {
    // Block and thread indexing for parallelism
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride

    // Loop through data with stride to cover all elements
    for (int i = index; i < size; i += stride) {
        C[i] = acos(A[i]); // Compute acos for each element
    }
}