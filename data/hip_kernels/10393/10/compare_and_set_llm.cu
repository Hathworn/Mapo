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
__global__ void compare_and_set(double* A, double* ret, int rlen, int clen, double compareVal, double tol, double ifEqualsVal, double ifLessThanVal, double ifGreaterThanVal) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int ix = tid / clen;
    int iy = tid % clen;
    
    // Combine calculations to reduce operations
    if (ix < rlen) {
        int index = ix * clen + iy;
        if (iy < clen) {
            double diff = A[index] - compareVal;
            // Use ternary operations for compactness
            ret[index] = (abs(diff) < tol) ? ifEqualsVal : ((diff < 0) ? ifLessThanVal : ifGreaterThanVal);
        }
    }
}