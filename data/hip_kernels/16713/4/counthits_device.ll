; ModuleID = '../data/hip_kernels/16713/4/main.cu'
source_filename = "../data/hip_kernels/16713/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent norecurse nounwind
define protected amdgpu_kernel void @_Z9counthitsiPjj(i32 %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 0, i64 0) #2, !srcloc !4
  %5 = extractvalue { i64, i64 } %4, 0
  %6 = lshr i64 %5, 32
  %7 = trunc i64 %6 to i32
  %8 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 0, i64 0) #2, !srcloc !4
  %9 = extractvalue { i64, i64 } %8, 0
  %10 = lshr i64 %9, 32
  %11 = trunc i64 %10 to i32
  %12 = xor i32 %11, -559038737
  %13 = xor i32 %7, -559038737
  %14 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %12, i64 0) #2, !srcloc !4
  %15 = extractvalue { i64, i64 } %14, 0
  %16 = lshr i64 %15, 32
  %17 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %13, i64 0) #2, !srcloc !4
  %18 = extractvalue { i64, i64 } %17, 0
  %19 = lshr i64 %18, 32
  %20 = xor i64 %19, %9
  %21 = trunc i64 %20 to i32
  %22 = xor i32 %21, 2095397032
  %23 = xor i64 %16, %5
  %24 = trunc i64 %23 to i32
  %25 = xor i32 %24, -1709871756
  %26 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %22, i64 0) #2, !srcloc !4
  %27 = extractvalue { i64, i64 } %26, 0
  %28 = lshr i64 %27, 32
  %29 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %25, i64 0) #2, !srcloc !4
  %30 = extractvalue { i64, i64 } %29, 0
  %31 = lshr i64 %30, 32
  %32 = xor i64 %31, %18
  %33 = trunc i64 %32 to i32
  %34 = xor i32 %33, 454865505
  %35 = xor i64 %28, %15
  %36 = trunc i64 %35 to i32
  %37 = xor i32 %36, 1434262521
  %38 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %34, i64 0) #2, !srcloc !4
  %39 = extractvalue { i64, i64 } %38, 0
  %40 = lshr i64 %39, 32
  %41 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %37, i64 0) #2, !srcloc !4
  %42 = extractvalue { i64, i64 } %41, 0
  %43 = lshr i64 %42, 32
  %44 = xor i64 %43, %30
  %45 = trunc i64 %44 to i32
  %46 = xor i32 %45, -1185666022
  %47 = xor i64 %40, %27
  %48 = trunc i64 %47 to i32
  %49 = xor i32 %48, 283429502
  %50 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %46, i64 0) #2, !srcloc !4
  %51 = extractvalue { i64, i64 } %50, 0
  %52 = lshr i64 %51, 32
  %53 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %49, i64 0) #2, !srcloc !4
  %54 = extractvalue { i64, i64 } %53, 0
  %55 = lshr i64 %54, 32
  %56 = xor i64 %55, %42
  %57 = trunc i64 %56 to i32
  %58 = xor i32 %57, 1468769747
  %59 = xor i64 %52, %39
  %60 = trunc i64 %59 to i32
  %61 = xor i32 %60, -867403517
  %62 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %58, i64 0) #2, !srcloc !4
  %63 = extractvalue { i64, i64 } %62, 0
  %64 = lshr i64 %63, 32
  %65 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %61, i64 0) #2, !srcloc !4
  %66 = extractvalue { i64, i64 } %65, 0
  %67 = lshr i64 %66, 32
  %68 = xor i64 %67, %54
  %69 = trunc i64 %68 to i32
  %70 = xor i32 %69, -171761780
  %71 = xor i64 %64, %51
  %72 = trunc i64 %71 to i32
  %73 = xor i32 %72, -2018236536
  %74 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %70, i64 0) #2, !srcloc !4
  %75 = extractvalue { i64, i64 } %74, 0
  %76 = lshr i64 %75, 32
  %77 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %73, i64 0) #2, !srcloc !4
  %78 = extractvalue { i64, i64 } %77, 0
  %79 = lshr i64 %78, 32
  %80 = xor i64 %79, %66
  %81 = trunc i64 %80 to i32
  %82 = xor i32 %81, -1812293307
  %83 = xor i64 %76, %63
  %84 = trunc i64 %83 to i32
  %85 = xor i32 %84, 1125897741
  %86 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %82, i64 0) #2, !srcloc !4
  %87 = extractvalue { i64, i64 } %86, 0
  %88 = lshr i64 %87, 32
  %89 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %85, i64 0) #2, !srcloc !4
  %90 = extractvalue { i64, i64 } %89, 0
  %91 = lshr i64 %90, 32
  %92 = xor i64 %91, %78
  %93 = trunc i64 %92 to i32
  %94 = xor i32 %93, 842142462
  %95 = xor i64 %88, %75
  %96 = trunc i64 %95 to i32
  %97 = xor i32 %96, -24935278
  %98 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %94, i64 0) #2, !srcloc !4
  %99 = extractvalue { i64, i64 } %98, 0
  %100 = lshr i64 %99, 32
  %101 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %97, i64 0) #2, !srcloc !4
  %102 = extractvalue { i64, i64 } %101, 0
  %103 = lshr i64 %102, 32
  %104 = xor i64 %103, %90
  %105 = trunc i64 %104 to i32
  %106 = xor i32 %105, -798389065
  %107 = xor i64 %100, %87
  %108 = trunc i64 %107 to i32
  %109 = xor i32 %108, -1175768297
  %110 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %106, i64 0) #2, !srcloc !4
  %111 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %109, i64 0) #2, !srcloc !4
  %112 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !5
  %113 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %114 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %115 = getelementptr i8, i8 addrspace(4)* %114, i64 4
  %116 = bitcast i8 addrspace(4)* %115 to i16 addrspace(4)*
  %117 = load i16, i16 addrspace(4)* %116, align 4, !range !6, !invariant.load !7
  %118 = zext i16 %117 to i32
  %119 = mul i32 %113, %118
  %120 = add i32 %119, %112
  %121 = add i32 %120, %2
  %122 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 0, i64 0) #2, !srcloc !4
  %123 = extractvalue { i64, i64 } %122, 0
  %124 = lshr i64 %123, 32
  %125 = trunc i64 %124 to i32
  %126 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %121, i64 0) #2, !srcloc !4
  %127 = extractvalue { i64, i64 } %126, 0
  %128 = lshr i64 %127, 32
  %129 = trunc i64 %128 to i32
  %130 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %129, i64 0) #2, !srcloc !4
  %131 = extractvalue { i64, i64 } %130, 0
  %132 = lshr i64 %131, 32
  %133 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %125, i64 0) #2, !srcloc !4
  %134 = extractvalue { i64, i64 } %133, 0
  %135 = lshr i64 %134, 32
  %136 = xor i64 %135, %127
  %137 = trunc i64 %136 to i32
  %138 = xor i32 %137, -1640531527
  %139 = xor i64 %132, %123
  %140 = trunc i64 %139 to i32
  %141 = xor i32 %140, -1150833019
  %142 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %138, i64 0) #2, !srcloc !4
  %143 = extractvalue { i64, i64 } %142, 0
  %144 = lshr i64 %143, 32
  %145 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %141, i64 0) #2, !srcloc !4
  %146 = extractvalue { i64, i64 } %145, 0
  %147 = lshr i64 %146, 32
  %148 = xor i64 %147, %134
  %149 = trunc i64 %148 to i32
  %150 = xor i32 %149, 1013904242
  %151 = xor i64 %144, %131
  %152 = trunc i64 %151 to i32
  %153 = xor i32 %152, 1993301258
  %154 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %150, i64 0) #2, !srcloc !4
  %155 = extractvalue { i64, i64 } %154, 0
  %156 = lshr i64 %155, 32
  %157 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %153, i64 0) #2, !srcloc !4
  %158 = extractvalue { i64, i64 } %157, 0
  %159 = lshr i64 %158, 32
  %160 = xor i64 %159, %146
  %161 = trunc i64 %160 to i32
  %162 = xor i32 %161, -626627285
  %163 = xor i64 %156, %143
  %164 = trunc i64 %163 to i32
  %165 = xor i32 %164, 842468239
  %166 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %162, i64 0) #2, !srcloc !4
  %167 = extractvalue { i64, i64 } %166, 0
  %168 = lshr i64 %167, 32
  %169 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %165, i64 0) #2, !srcloc !4
  %170 = extractvalue { i64, i64 } %169, 0
  %171 = lshr i64 %170, 32
  %172 = xor i64 %171, %158
  %173 = trunc i64 %172 to i32
  %174 = xor i32 %173, 2027808484
  %175 = xor i64 %168, %155
  %176 = trunc i64 %175 to i32
  %177 = xor i32 %176, -308364780
  %178 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %174, i64 0) #2, !srcloc !4
  %179 = extractvalue { i64, i64 } %178, 0
  %180 = lshr i64 %179, 32
  %181 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %177, i64 0) #2, !srcloc !4
  %182 = extractvalue { i64, i64 } %181, 0
  %183 = lshr i64 %182, 32
  %184 = xor i64 %183, %170
  %185 = trunc i64 %184 to i32
  %186 = xor i32 %185, 387276957
  %187 = xor i64 %180, %167
  %188 = trunc i64 %187 to i32
  %189 = xor i32 %188, -1459197799
  %190 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %186, i64 0) #2, !srcloc !4
  %191 = extractvalue { i64, i64 } %190, 0
  %192 = lshr i64 %191, 32
  %193 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %189, i64 0) #2, !srcloc !4
  %194 = extractvalue { i64, i64 } %193, 0
  %195 = lshr i64 %194, 32
  %196 = xor i64 %195, %182
  %197 = trunc i64 %196 to i32
  %198 = xor i32 %197, -1253254570
  %199 = xor i64 %192, %179
  %200 = trunc i64 %199 to i32
  %201 = xor i32 %200, 1684936478
  %202 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %198, i64 0) #2, !srcloc !4
  %203 = extractvalue { i64, i64 } %202, 0
  %204 = lshr i64 %203, 32
  %205 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %201, i64 0) #2, !srcloc !4
  %206 = extractvalue { i64, i64 } %205, 0
  %207 = lshr i64 %206, 32
  %208 = xor i64 %207, %194
  %209 = trunc i64 %208 to i32
  %210 = xor i32 %209, 1401181199
  %211 = xor i64 %204, %191
  %212 = trunc i64 %211 to i32
  %213 = xor i32 %212, 534103459
  %214 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %210, i64 0) #2, !srcloc !4
  %215 = extractvalue { i64, i64 } %214, 0
  %216 = lshr i64 %215, 32
  %217 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %213, i64 0) #2, !srcloc !4
  %218 = extractvalue { i64, i64 } %217, 0
  %219 = lshr i64 %218, 32
  %220 = xor i64 %219, %206
  %221 = trunc i64 %220 to i32
  %222 = xor i32 %221, -239350328
  %223 = xor i64 %216, %203
  %224 = trunc i64 %223 to i32
  %225 = xor i32 %224, -616729560
  %226 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %222, i64 0) #2, !srcloc !4
  %227 = extractvalue { i64, i64 } %226, 0
  %228 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %225, i64 0) #2, !srcloc !4
  %229 = extractvalue { i64, i64 } %228, 0
  %230 = icmp sgt i32 %0, 0
  br i1 %230, label %231, label %432

231:                                              ; preds = %3
  %232 = lshr i64 %229, 32
  %233 = xor i64 %232, %218
  %234 = trunc i64 %233 to i32
  %235 = xor i32 %234, -1879881855
  %236 = insertelement <4 x i32> undef, i32 %235, i64 0
  %237 = trunc i64 %229 to i32
  %238 = insertelement <4 x i32> %236, i32 %237, i64 1
  %239 = lshr i64 %227, 32
  %240 = xor i64 %239, %215
  %241 = trunc i64 %240 to i32
  %242 = xor i32 %241, -1767562579
  %243 = insertelement <4 x i32> %238, i32 %242, i64 2
  %244 = trunc i64 %227 to i32
  %245 = insertelement <4 x i32> %243, i32 %244, i64 3
  %246 = insertelement <4 x i32> <i32 0, i32 0, i32 poison, i32 0>, i32 %121, i64 2
  br label %247

247:                                              ; preds = %231, %247
  %248 = phi i32 [ %429, %247 ], [ 0, %231 ]
  %249 = phi i32 [ %430, %247 ], [ 0, %231 ]
  %250 = phi <4 x i32> [ %269, %247 ], [ %246, %231 ]
  %251 = phi <4 x i32> [ %393, %247 ], [ %245, %231 ]
  %252 = extractelement <4 x i32> %250, i64 0
  %253 = add i32 %252, 1
  %254 = insertelement <4 x i32> poison, i32 %253, i64 0
  %255 = icmp eq i32 %253, 0
  %256 = zext i1 %255 to i32
  %257 = extractelement <4 x i32> %250, i64 1
  %258 = add i32 %257, %256
  %259 = insertelement <4 x i32> %254, i32 %258, i64 1
  %260 = icmp eq i32 %258, 0
  %261 = select i1 %260, i32 %256, i32 0
  %262 = extractelement <4 x i32> %250, i64 2
  %263 = add i32 %261, %262
  %264 = insertelement <4 x i32> %259, i32 %263, i64 2
  %265 = icmp eq i32 %263, 0
  %266 = select i1 %265, i32 %261, i32 0
  %267 = extractelement <4 x i32> %250, i64 3
  %268 = add i32 %266, %267
  %269 = insertelement <4 x i32> %264, i32 %268, i64 3
  %270 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %253, i64 0) #2, !srcloc !4
  %271 = extractvalue { i64, i64 } %270, 0
  %272 = lshr i64 %271, 32
  %273 = trunc i64 %272 to i32
  %274 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %263, i64 0) #2, !srcloc !4
  %275 = extractvalue { i64, i64 } %274, 0
  %276 = lshr i64 %275, 32
  %277 = trunc i64 %276 to i32
  %278 = xor i32 %258, %277
  %279 = xor i32 %268, %273
  %280 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %278, i64 0) #2, !srcloc !4
  %281 = extractvalue { i64, i64 } %280, 0
  %282 = lshr i64 %281, 32
  %283 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %279, i64 0) #2, !srcloc !4
  %284 = extractvalue { i64, i64 } %283, 0
  %285 = lshr i64 %284, 32
  %286 = xor i64 %285, %275
  %287 = trunc i64 %286 to i32
  %288 = xor i32 %287, -1640531527
  %289 = xor i64 %282, %271
  %290 = trunc i64 %289 to i32
  %291 = xor i32 %290, -1150833019
  %292 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %288, i64 0) #2, !srcloc !4
  %293 = extractvalue { i64, i64 } %292, 0
  %294 = lshr i64 %293, 32
  %295 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %291, i64 0) #2, !srcloc !4
  %296 = extractvalue { i64, i64 } %295, 0
  %297 = lshr i64 %296, 32
  %298 = xor i64 %297, %284
  %299 = trunc i64 %298 to i32
  %300 = xor i32 %299, 1013904242
  %301 = xor i64 %294, %281
  %302 = trunc i64 %301 to i32
  %303 = xor i32 %302, 1993301258
  %304 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %300, i64 0) #2, !srcloc !4
  %305 = extractvalue { i64, i64 } %304, 0
  %306 = lshr i64 %305, 32
  %307 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %303, i64 0) #2, !srcloc !4
  %308 = extractvalue { i64, i64 } %307, 0
  %309 = lshr i64 %308, 32
  %310 = xor i64 %309, %296
  %311 = trunc i64 %310 to i32
  %312 = xor i32 %311, -626627285
  %313 = xor i64 %306, %293
  %314 = trunc i64 %313 to i32
  %315 = xor i32 %314, 842468239
  %316 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %312, i64 0) #2, !srcloc !4
  %317 = extractvalue { i64, i64 } %316, 0
  %318 = lshr i64 %317, 32
  %319 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %315, i64 0) #2, !srcloc !4
  %320 = extractvalue { i64, i64 } %319, 0
  %321 = lshr i64 %320, 32
  %322 = xor i64 %321, %308
  %323 = trunc i64 %322 to i32
  %324 = xor i32 %323, 2027808484
  %325 = xor i64 %318, %305
  %326 = trunc i64 %325 to i32
  %327 = xor i32 %326, -308364780
  %328 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %324, i64 0) #2, !srcloc !4
  %329 = extractvalue { i64, i64 } %328, 0
  %330 = lshr i64 %329, 32
  %331 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %327, i64 0) #2, !srcloc !4
  %332 = extractvalue { i64, i64 } %331, 0
  %333 = lshr i64 %332, 32
  %334 = xor i64 %333, %320
  %335 = trunc i64 %334 to i32
  %336 = xor i32 %335, 387276957
  %337 = xor i64 %330, %317
  %338 = trunc i64 %337 to i32
  %339 = xor i32 %338, -1459197799
  %340 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %336, i64 0) #2, !srcloc !4
  %341 = extractvalue { i64, i64 } %340, 0
  %342 = lshr i64 %341, 32
  %343 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %339, i64 0) #2, !srcloc !4
  %344 = extractvalue { i64, i64 } %343, 0
  %345 = lshr i64 %344, 32
  %346 = xor i64 %345, %332
  %347 = trunc i64 %346 to i32
  %348 = xor i32 %347, -1253254570
  %349 = xor i64 %342, %329
  %350 = trunc i64 %349 to i32
  %351 = xor i32 %350, 1684936478
  %352 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %348, i64 0) #2, !srcloc !4
  %353 = extractvalue { i64, i64 } %352, 0
  %354 = lshr i64 %353, 32
  %355 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %351, i64 0) #2, !srcloc !4
  %356 = extractvalue { i64, i64 } %355, 0
  %357 = lshr i64 %356, 32
  %358 = xor i64 %357, %344
  %359 = trunc i64 %358 to i32
  %360 = xor i32 %359, 1401181199
  %361 = xor i64 %354, %341
  %362 = trunc i64 %361 to i32
  %363 = xor i32 %362, 534103459
  %364 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %360, i64 0) #2, !srcloc !4
  %365 = extractvalue { i64, i64 } %364, 0
  %366 = lshr i64 %365, 32
  %367 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %363, i64 0) #2, !srcloc !4
  %368 = extractvalue { i64, i64 } %367, 0
  %369 = lshr i64 %368, 32
  %370 = xor i64 %369, %356
  %371 = trunc i64 %370 to i32
  %372 = xor i32 %371, -239350328
  %373 = xor i64 %366, %353
  %374 = trunc i64 %373 to i32
  %375 = xor i32 %374, -616729560
  %376 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -766435501, i32 %372, i64 0) #2, !srcloc !4
  %377 = extractvalue { i64, i64 } %376, 0
  %378 = lshr i64 %377, 32
  %379 = trunc i64 %377 to i32
  %380 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 -845247145, i32 %375, i64 0) #2, !srcloc !4
  %381 = extractvalue { i64, i64 } %380, 0
  %382 = lshr i64 %381, 32
  %383 = trunc i64 %381 to i32
  %384 = xor i64 %382, %368
  %385 = trunc i64 %384 to i32
  %386 = xor i32 %385, -1879881855
  %387 = xor i64 %378, %365
  %388 = trunc i64 %387 to i32
  %389 = xor i32 %388, -1767562579
  %390 = insertelement <4 x i32> undef, i32 %386, i64 0
  %391 = insertelement <4 x i32> %390, i32 %383, i64 1
  %392 = insertelement <4 x i32> %391, i32 %389, i64 2
  %393 = insertelement <4 x i32> %392, i32 %379, i64 3
  %394 = extractelement <4 x i32> %251, i64 0
  %395 = uitofp i32 %394 to float
  %396 = fmul contract float %395, 0x3DF0000000000000
  %397 = fadd contract float %396, 0x3DF0000000000000
  %398 = extractelement <4 x i32> %251, i64 1
  %399 = uitofp i32 %398 to float
  %400 = fmul contract float %399, 0x3DF0000000000000
  %401 = fadd contract float %400, 0x3DF0000000000000
  %402 = extractelement <4 x i32> %251, i64 2
  %403 = uitofp i32 %402 to float
  %404 = fmul contract float %403, 0x3DF0000000000000
  %405 = fadd contract float %404, 0x3DF0000000000000
  %406 = extractelement <4 x i32> %251, i64 3
  %407 = uitofp i32 %406 to float
  %408 = fmul contract float %407, 0x3DF0000000000000
  %409 = fadd contract float %408, 0x3DF0000000000000
  %410 = fmul contract float %397, 2.000000e+00
  %411 = fadd contract float %410, -1.000000e+00
  %412 = fmul contract float %401, 2.000000e+00
  %413 = fadd contract float %412, -1.000000e+00
  %414 = fmul contract float %405, 2.000000e+00
  %415 = fadd contract float %414, -1.000000e+00
  %416 = fmul contract float %409, 2.000000e+00
  %417 = fadd contract float %416, -1.000000e+00
  %418 = fmul contract float %411, %411
  %419 = fmul contract float %413, %413
  %420 = fadd contract float %418, %419
  %421 = fcmp contract olt float %420, 1.000000e+00
  %422 = zext i1 %421 to i32
  %423 = add i32 %248, %422
  %424 = fmul contract float %415, %415
  %425 = fmul contract float %417, %417
  %426 = fadd contract float %424, %425
  %427 = fcmp contract olt float %426, 1.000000e+00
  %428 = zext i1 %427 to i32
  %429 = add i32 %423, %428
  %430 = add nuw nsw i32 %249, 2
  %431 = icmp slt i32 %430, %0
  br i1 %431, label %247, label %432, !llvm.loop !8

432:                                              ; preds = %247, %3
  %433 = phi i32 [ 0, %3 ], [ %429, %247 ]
  %434 = sext i32 %120 to i64
  %435 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %434
  store i32 %433, i32 addrspace(1)* %435, align 4, !tbaa !10
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { convergent norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="128" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i64 5995741}
!5 = !{i32 0, i32 1024}
!6 = !{i16 1, i16 1025}
!7 = !{}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C++ TBAA"}
