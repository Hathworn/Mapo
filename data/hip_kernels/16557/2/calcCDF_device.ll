; ModuleID = '../data/hip_kernels/16557/2/main.cu'
source_filename = "../data/hip_kernels/16557/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7calcCDFPfPjiiiE11partialScan = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7calcCDFPfPjiii(float addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = add i32 %13, %6
  %15 = icmp slt i32 %14, 256
  br i1 %15, label %16, label %25

16:                                               ; preds = %5
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !7, !amdgpu.noclobber !6
  %20 = uitofp i32 %19 to float
  %21 = mul nsw i32 %3, %2
  %22 = sitofp i32 %21 to float
  %23 = fdiv contract float %20, %22
  %24 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %14
  store float %23, float addrspace(3)* %24, align 4, !tbaa !11
  br label %25

25:                                               ; preds = %16, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = shl nuw nsw i32 %6, 1
  %27 = add nuw nsw i32 %26, 2
  %28 = add nuw nsw i32 %26, 1
  %29 = icmp ult i32 %6, 256
  %30 = icmp ult i32 %28, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %38

32:                                               ; preds = %25
  %33 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %26
  %34 = load float, float addrspace(3)* %33, align 8, !tbaa !11
  %35 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %28
  %36 = load float, float addrspace(3)* %35, align 4, !tbaa !11
  %37 = fadd contract float %34, %36
  store float %37, float addrspace(3)* %35, align 4, !tbaa !11
  br label %38

38:                                               ; preds = %32, %25
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = shl nuw nsw i32 %27, 1
  %40 = add nsw i32 %39, -1
  %41 = icmp ult i32 %6, 128
  %42 = icmp ult i32 %40, %4
  %43 = select i1 %41, i1 %42, i1 false
  br i1 %43, label %44, label %51

44:                                               ; preds = %38
  %45 = add nsw i32 %39, -3
  %46 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !11
  %48 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %40
  %49 = load float, float addrspace(3)* %48, align 4, !tbaa !11
  %50 = fadd contract float %47, %49
  store float %50, float addrspace(3)* %48, align 4, !tbaa !11
  br label %51

51:                                               ; preds = %44, %38
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = shl nuw nsw i32 %27, 2
  %53 = add nsw i32 %52, -1
  %54 = icmp ult i32 %6, 64
  %55 = icmp ult i32 %53, %4
  %56 = select i1 %54, i1 %55, i1 false
  br i1 %56, label %57, label %64

57:                                               ; preds = %51
  %58 = add nsw i32 %52, -5
  %59 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !11
  %61 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %53
  %62 = load float, float addrspace(3)* %61, align 4, !tbaa !11
  %63 = fadd contract float %60, %62
  store float %63, float addrspace(3)* %61, align 4, !tbaa !11
  br label %64

64:                                               ; preds = %57, %51
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %65 = shl nuw nsw i32 %27, 3
  %66 = add nsw i32 %65, -1
  %67 = icmp ult i32 %6, 32
  %68 = icmp ult i32 %66, %4
  %69 = select i1 %67, i1 %68, i1 false
  br i1 %69, label %70, label %77

70:                                               ; preds = %64
  %71 = add nsw i32 %65, -9
  %72 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %71
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !11
  %74 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %66
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !11
  %76 = fadd contract float %73, %75
  store float %76, float addrspace(3)* %74, align 4, !tbaa !11
  br label %77

77:                                               ; preds = %70, %64
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %78 = shl nuw nsw i32 %27, 4
  %79 = add nsw i32 %78, -1
  %80 = icmp ult i32 %6, 16
  %81 = icmp ult i32 %79, %4
  %82 = select i1 %80, i1 %81, i1 false
  br i1 %82, label %83, label %90

83:                                               ; preds = %77
  %84 = add nsw i32 %78, -17
  %85 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %84
  %86 = load float, float addrspace(3)* %85, align 4, !tbaa !11
  %87 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %79
  %88 = load float, float addrspace(3)* %87, align 4, !tbaa !11
  %89 = fadd contract float %86, %88
  store float %89, float addrspace(3)* %87, align 4, !tbaa !11
  br label %90

90:                                               ; preds = %83, %77
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = shl nuw nsw i32 %27, 5
  %92 = add nsw i32 %91, -1
  %93 = icmp ult i32 %6, 8
  %94 = icmp ult i32 %92, %4
  %95 = select i1 %93, i1 %94, i1 false
  br i1 %95, label %96, label %103

96:                                               ; preds = %90
  %97 = add nsw i32 %91, -33
  %98 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %97
  %99 = load float, float addrspace(3)* %98, align 4, !tbaa !11
  %100 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %92
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !11
  %102 = fadd contract float %99, %101
  store float %102, float addrspace(3)* %100, align 4, !tbaa !11
  br label %103

103:                                              ; preds = %96, %90
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = shl nuw nsw i32 %27, 6
  %105 = add nsw i32 %104, -1
  %106 = icmp ult i32 %6, 4
  %107 = icmp ult i32 %105, %4
  %108 = select i1 %106, i1 %107, i1 false
  br i1 %108, label %109, label %116

109:                                              ; preds = %103
  %110 = add nsw i32 %104, -65
  %111 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %110
  %112 = load float, float addrspace(3)* %111, align 4, !tbaa !11
  %113 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %105
  %114 = load float, float addrspace(3)* %113, align 4, !tbaa !11
  %115 = fadd contract float %112, %114
  store float %115, float addrspace(3)* %113, align 4, !tbaa !11
  br label %116

116:                                              ; preds = %109, %103
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %117 = shl nuw nsw i32 %27, 7
  %118 = add nsw i32 %117, -1
  %119 = icmp ult i32 %6, 2
  %120 = icmp ult i32 %118, %4
  %121 = select i1 %119, i1 %120, i1 false
  br i1 %121, label %122, label %129

122:                                              ; preds = %116
  %123 = add nsw i32 %117, -129
  %124 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !11
  %126 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %118
  %127 = load float, float addrspace(3)* %126, align 4, !tbaa !11
  %128 = fadd contract float %125, %127
  store float %128, float addrspace(3)* %126, align 4, !tbaa !11
  br label %129

129:                                              ; preds = %122, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %130 = shl nuw nsw i32 %27, 8
  %131 = add nsw i32 %130, -1
  %132 = icmp eq i32 %6, 0
  %133 = icmp ult i32 %131, %4
  %134 = select i1 %132, i1 %133, i1 false
  br i1 %134, label %135, label %142

135:                                              ; preds = %129
  %136 = add nsw i32 %130, -257
  %137 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %136
  %138 = load float, float addrspace(3)* %137, align 4, !tbaa !11
  %139 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %131
  %140 = load float, float addrspace(3)* %139, align 4, !tbaa !11
  %141 = fadd contract float %138, %140
  store float %141, float addrspace(3)* %139, align 4, !tbaa !11
  br label %142

142:                                              ; preds = %135, %129
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %143 = add nuw nsw i32 %117, 127
  %144 = icmp eq i32 %6, 0
  %145 = icmp ult i32 %143, %4
  %146 = select i1 %144, i1 %145, i1 false
  br i1 %146, label %147, label %153

147:                                              ; preds = %142
  %148 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %118
  %149 = load float, float addrspace(3)* %148, align 4, !tbaa !11
  %150 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %143
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !11
  %152 = fadd contract float %149, %151
  store float %152, float addrspace(3)* %150, align 4, !tbaa !11
  br label %153

153:                                              ; preds = %147, %142
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = add nuw nsw i32 %104, 63
  %155 = icmp ult i32 %6, 3
  %156 = icmp ult i32 %154, %4
  %157 = select i1 %155, i1 %156, i1 false
  br i1 %157, label %158, label %164

158:                                              ; preds = %153
  %159 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %105
  %160 = load float, float addrspace(3)* %159, align 4, !tbaa !11
  %161 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %154
  %162 = load float, float addrspace(3)* %161, align 4, !tbaa !11
  %163 = fadd contract float %160, %162
  store float %163, float addrspace(3)* %161, align 4, !tbaa !11
  br label %164

164:                                              ; preds = %158, %153
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %165 = add nuw nsw i32 %91, 31
  %166 = icmp ult i32 %6, 7
  %167 = icmp ult i32 %165, %4
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %169, label %175

169:                                              ; preds = %164
  %170 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %92
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !11
  %172 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %165
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !11
  %174 = fadd contract float %171, %173
  store float %174, float addrspace(3)* %172, align 4, !tbaa !11
  br label %175

175:                                              ; preds = %169, %164
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %176 = add nuw nsw i32 %78, 15
  %177 = icmp ult i32 %6, 15
  %178 = icmp ult i32 %176, %4
  %179 = select i1 %177, i1 %178, i1 false
  br i1 %179, label %180, label %186

180:                                              ; preds = %175
  %181 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %79
  %182 = load float, float addrspace(3)* %181, align 4, !tbaa !11
  %183 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %176
  %184 = load float, float addrspace(3)* %183, align 4, !tbaa !11
  %185 = fadd contract float %182, %184
  store float %185, float addrspace(3)* %183, align 4, !tbaa !11
  br label %186

186:                                              ; preds = %180, %175
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %187 = add nuw nsw i32 %65, 7
  %188 = icmp ult i32 %6, 31
  %189 = icmp ult i32 %187, %4
  %190 = select i1 %188, i1 %189, i1 false
  br i1 %190, label %191, label %197

191:                                              ; preds = %186
  %192 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %66
  %193 = load float, float addrspace(3)* %192, align 4, !tbaa !11
  %194 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %187
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !11
  %196 = fadd contract float %193, %195
  store float %196, float addrspace(3)* %194, align 4, !tbaa !11
  br label %197

197:                                              ; preds = %191, %186
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %198 = add nuw nsw i32 %52, 3
  %199 = icmp ult i32 %6, 63
  %200 = icmp ult i32 %198, %4
  %201 = select i1 %199, i1 %200, i1 false
  br i1 %201, label %202, label %208

202:                                              ; preds = %197
  %203 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %53
  %204 = load float, float addrspace(3)* %203, align 4, !tbaa !11
  %205 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %198
  %206 = load float, float addrspace(3)* %205, align 4, !tbaa !11
  %207 = fadd contract float %204, %206
  store float %207, float addrspace(3)* %205, align 4, !tbaa !11
  br label %208

208:                                              ; preds = %202, %197
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %209 = add nuw nsw i32 %39, 1
  %210 = icmp ult i32 %6, 127
  %211 = icmp ult i32 %209, %4
  %212 = select i1 %210, i1 %211, i1 false
  br i1 %212, label %213, label %219

213:                                              ; preds = %208
  %214 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %40
  %215 = load float, float addrspace(3)* %214, align 4, !tbaa !11
  %216 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %209
  %217 = load float, float addrspace(3)* %216, align 4, !tbaa !11
  %218 = fadd contract float %215, %217
  store float %218, float addrspace(3)* %216, align 4, !tbaa !11
  br label %219

219:                                              ; preds = %213, %208
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %220 = icmp ult i32 %6, 255
  %221 = icmp ult i32 %27, %4
  %222 = select i1 %220, i1 %221, i1 false
  br i1 %222, label %223, label %229

223:                                              ; preds = %219
  %224 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %28
  %225 = load float, float addrspace(3)* %224, align 4, !tbaa !11
  %226 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %27
  %227 = load float, float addrspace(3)* %226, align 8, !tbaa !11
  %228 = fadd contract float %225, %227
  store float %228, float addrspace(3)* %226, align 8, !tbaa !11
  br label %229

229:                                              ; preds = %223, %219
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %230, label %237

230:                                              ; preds = %229
  %231 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ7calcCDFPfPjiiiE11partialScan, i32 0, i32 %6
  %232 = load float, float addrspace(3)* %231, align 4, !tbaa !11
  %233 = sext i32 %14 to i64
  %234 = getelementptr inbounds float, float addrspace(1)* %0, i64 %233
  %235 = load float, float addrspace(1)* %234, align 4, !tbaa !11
  %236 = fadd contract float %232, %235
  store float %236, float addrspace(1)* %234, align 4, !tbaa !11
  br label %237

237:                                              ; preds = %230, %229
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !9, i64 0}
