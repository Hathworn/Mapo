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

// dim => rlen (Assumption: rlen == clen)
// N = length of dense array
extern "C"

__global__ void copyUpperToLowerTriangleDense(double* ret, int dim, int N) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Restrict threads to process only lower triangle (iy > ix)
    if (ix >= dim || iy >= dim || iy <= ix)
        return;

    int id_dest = iy * dim + ix;
    int id_src = ix * dim + iy;
    
    // Ensure that the destination index is within bounds
    if (id_dest < N) {
        ret[id_dest] = ret[id_src];
    }
}